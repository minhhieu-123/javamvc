package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Roles;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.RoleReponsitory;
import vn.hoidanit.laptopshop.repository.UserReponsitory;

@Service
public class UserService {
    private final UserReponsitory userReponsitory;
     private final RoleReponsitory roleReponsitory;
    public UserService(UserReponsitory userReponsitory,RoleReponsitory roleReponsitory) {
        this.userReponsitory = userReponsitory;
        this.roleReponsitory=roleReponsitory;
    }
    public List<User> getAllUser(){
        return this.userReponsitory.findAll();
    }
     public List<User> getAllUsersByEmail(String email){
        return this.userReponsitory.findByEmail(email);
    }
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
}
