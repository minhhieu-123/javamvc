package vn.hoidanit.laptopshop.controller;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;
    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder=passwordEncoder;
    }
    // @RequestMapping("/")
    // public String getHomePage(Model model){
    //     List<User> arrUsers = this.userService.getAllUsersByEmail("2131");
    //     System.out.println("home page"+arrUsers);
    //     model.addAttribute("eric", "asdas");
    //        model.addAttribute("hieu", "toi la minh hieu");
    //     return "abc";
    // }
     @RequestMapping("/admin/user")
    public String getUserPage(Model model){
        List<User> users =this.userService.getAllUser();
        model.addAttribute("user1", users);
        return "admin/user/table-user";
    }

     @RequestMapping("/admin/user/{iduser}")
    public String getUserDetailPage(Model model, @PathVariable long iduser){
        System.out.println("check path"+ iduser);
        User user = this.userService.getUserByID(iduser);
        System.out.println("lay ra user tu id"+user);
         model.addAttribute("id", iduser);
          model.addAttribute("user", user);
        return "admin/user/show-user";
    }
    @RequestMapping("/admin/user/updateuser/{iduser}")
    public String getUpdateUserPage(Model model,  @PathVariable long iduser){
        User currentUser = this.userService.getUserByID(iduser);
        model.addAttribute("newUsers", currentUser);
        return "admin/user/update-user";
    }
    @GetMapping("/admin/user/create")
    public String getCreatePage(Model model){
        model.addAttribute("newUsers", new User());
        return "admin/user/create";
    }
    @PostMapping(value = "/admin/user/create")
     public String createUserPage(Model model, @ModelAttribute("newUsers") User minhhieu, @RequestParam("minhhieuFile") MultipartFile file){
        String avt = this.uploadService.handleSaveUploadFile(file, "avt");
        String hashPassword = this.passwordEncoder.encode(minhhieu.getPassworld());
        minhhieu.setAvatar(avt);
        minhhieu.setPassworld(hashPassword);
        minhhieu.setRole(this.userService.getRoleByName(minhhieu.getRole().getName()));
        this.userService.handleSaveUser(minhhieu);
        return "redirect:/admin/user";
    }
    @PostMapping("/admin/user/updateuser")
    public String postUpdateUserPage(Model model,  @ModelAttribute("newUsers") User minhhieu){
        User currentUser = this.userService.getUserByID(minhhieu.getId());
        model.addAttribute("newUsers", currentUser);
        if (currentUser != null) {
            currentUser.setAddress(minhhieu.getAddress());
            currentUser.setFullName(minhhieu.getFullName());
            currentUser.setPhone(minhhieu.getPhone());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }
    @GetMapping("/admin/user/delete/{iduser}")
    public String deleteUserPage(Model model,   @PathVariable long iduser){
        model.addAttribute("newUsers", new User());
        model.addAttribute("iduser", iduser);
        return "/admin/user/delete-user";
    }

    @PostMapping(value = "/admin/user/delete")
     public String postDeleteUserPage(Model model, @ModelAttribute("newUsers") User minhhieu){
        this.userService.deleteAllUser(minhhieu.getId());
        return "redirect:/admin/user";
    }
}
