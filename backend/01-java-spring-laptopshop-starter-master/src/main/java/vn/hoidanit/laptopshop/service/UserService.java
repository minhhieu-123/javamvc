package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Location;
import vn.hoidanit.laptopshop.domain.Roles;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.LocationReponsitory;
import vn.hoidanit.laptopshop.domain.DTO.RegisterDTO;
import vn.hoidanit.laptopshop.repository.RoleReponsitory;
import vn.hoidanit.laptopshop.repository.UserReponsitory;

@Service
public class UserService {

    private final LocationReponsitory locationReponsitory;
    private final UserReponsitory userReponsitory;
     private final RoleReponsitory roleReponsitory;
    public UserService(UserReponsitory userReponsitory,RoleReponsitory roleReponsitory, LocationReponsitory locationReponsitory) {
        this.userReponsitory = userReponsitory;
        this.roleReponsitory=roleReponsitory;
        this.locationReponsitory = locationReponsitory;
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
}
