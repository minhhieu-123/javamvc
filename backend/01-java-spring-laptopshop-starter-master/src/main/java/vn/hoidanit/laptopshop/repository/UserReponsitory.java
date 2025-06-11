package vn.hoidanit.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
// import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.User;

@Repository
public interface UserReponsitory extends JpaRepository<User, Long>{
    User save(User minhhieu);
    List<User> findOneByEmail(String email);
    void deleteById(long id);
    User findById(long id);
    List<User> findAll();
    boolean existsByEmail(String email);
    User findByEmail(String email);
}
