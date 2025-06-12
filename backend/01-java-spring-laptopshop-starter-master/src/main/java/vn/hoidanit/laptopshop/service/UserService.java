package vn.hoidanit.laptopshop.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.hoidanit.laptopshop.domain.EmailVerification;
import vn.hoidanit.laptopshop.domain.Location;
import vn.hoidanit.laptopshop.domain.Roles;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.EmailVerificationReponsitory;
import vn.hoidanit.laptopshop.repository.LocationReponsitory;
import vn.hoidanit.laptopshop.domain.DTO.RegisterDTO;
import vn.hoidanit.laptopshop.repository.RoleReponsitory;
import vn.hoidanit.laptopshop.repository.UserReponsitory;
import vn.hoidanit.laptopshop.service.validator.EmailService;

@Service
public class UserService {
    private final PasswordEncoder passwordEncoder;
    private final LocationReponsitory locationReponsitory;
    private final UserReponsitory userReponsitory;
     private final RoleReponsitory roleReponsitory;
     private final EmailVerificationReponsitory emailVerificationReponsitory;
     private final EmailService emailService;
    public UserService(UserReponsitory userReponsitory,RoleReponsitory roleReponsitory, LocationReponsitory locationReponsitory,EmailVerificationReponsitory emailVerificationReponsitory,PasswordEncoder passwordEncoder,EmailService emailService) {
        this.userReponsitory = userReponsitory;
        this.roleReponsitory=roleReponsitory;
        this.locationReponsitory = locationReponsitory;
        this.emailVerificationReponsitory=emailVerificationReponsitory;
        this.passwordEncoder=passwordEncoder;
        this.emailService=emailService;
    }
    public List<User> getAllUser(){
        return this.userReponsitory.findAll();
    }
    //  public List<User> getAllUsersByEmail(String email){
    //     return this.userReponsitory.findByEmail(email);
    // }
     public User getUserByID(long id ){
        return this.userReponsitory.findById(id);
    }
    public User handleSaveUser(User user){
        return this.userReponsitory.save(user);
    }
      public void deleteAllUser(long id){
        this.userReponsitory.deleteById(id);;
    }
    public Roles getRoleByName(String name){
        return this.roleReponsitory.findByName(name);
    }
    public User signupDTOUser(RegisterDTO registerDTO){
        User user = new User();
        user.setFullName(registerDTO.getFullName());
        user.setEmail(registerDTO.getEmail());
        user.setPassworld(registerDTO.getPassword());
        return user;
    }
    public boolean checkEmailExist(String email){
        return this.userReponsitory.existsByEmail(email);
    }
    public User getUserByEmail(String email){
        return this.userReponsitory.findByEmail(email);
    }
    public List<Location> fetchLocationByUser(User user){
        return this.locationReponsitory.findByUser(user);
    }
    public Location getLocationById(long id){
        return this.locationReponsitory.findById(id);
    }
    @Transactional
    public void registerUser(RegisterDTO request){
        if (userReponsitory.existsByEmail(request.getEmail())) {
             throw new RuntimeException("Email đã được sử dụng");
        }
        User user = new User();
        user.setEmail(request.getEmail());
        String rawPassword = request.getPassword();
        String hashPassword = this.passwordEncoder.encode(rawPassword);
        user.setPassworld(hashPassword);
        user.setRole(getRoleByName("USER"));
        user.setIsEnabled(false);
        user.setFullName(request.getFullName());
        User saveUser = this.userReponsitory.save(user);

        String token = UUID.randomUUID().toString();
        EmailVerification verification = new EmailVerification();
        verification.setToken(token);
        verification.setUser(saveUser);
        verification.setCreatedAt(LocalDateTime.now());
        verification.setTokenExpiry(LocalDateTime.now().plusHours(24));
        this.emailVerificationReponsitory.save(verification);

        emailService.sendVerificationEmail(saveUser.getEmail(), token);
    }

    @Transactional
    public boolean verifyEmail(String token){
      Optional<EmailVerification> verificationOpt = this.emailVerificationReponsitory.findByToken(token);
        if (verificationOpt.isEmpty()) {
            throw new RuntimeException("Token không tồn tại");
        }
        EmailVerification verification = verificationOpt.get();
        // Kiểm tra đã được xác thực
        if (verification.isVerified()) {
            throw new RuntimeException("Email đã được xác thực trước đó");
        }
        // Kiểm tra token đã hết hạn
        if (verification.isExpired()) {
            throw new RuntimeException("Token đã hết hạn");
        }
        // Xác thực thành công
        verification.setVerifiedAt(LocalDateTime.now());
        User user = verification.getUser();
        user.setIsEnabled(true);
        this.emailVerificationReponsitory.save(verification);
        this.userReponsitory.save(user);
        return true;
    }

    public void resendVerificationEmail(String email){
        User userOpt = this.userReponsitory.findByEmail(email);
        if (userOpt==null) {
            throw new RuntimeException("Email không tồn tại");
        }

        if (userOpt.getIsEnabled()) {
            throw new RuntimeException("Email đã tồn tại");
        }

        String newToken = UUID.randomUUID().toString();

        Optional<EmailVerification> verificationOpt = emailVerificationReponsitory.findByUserId(userOpt.getId());
        if(verificationOpt.isPresent()){
            EmailVerification verification = verificationOpt.get();
            verification.setToken(newToken);
            verification.setCreatedAt(LocalDateTime.now());
            verification.setTokenExpiry(LocalDateTime.now().plusHours(24));
            verification.setVerifiedAt(null);
            this.emailVerificationReponsitory.save(verification);
        }
        this.emailService.sendVerificationEmail(userOpt.getEmail(), newToken);

    }
}
