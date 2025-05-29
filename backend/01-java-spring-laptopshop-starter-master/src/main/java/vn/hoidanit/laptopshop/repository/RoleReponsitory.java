package vn.hoidanit.laptopshop.repository;


// import javax.management.relation.Role;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Roles;

@Repository
public interface RoleReponsitory extends JpaRepository<Roles, Long>{
    Roles findByName(String name);
}
