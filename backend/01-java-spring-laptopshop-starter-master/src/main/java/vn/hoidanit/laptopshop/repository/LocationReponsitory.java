package vn.hoidanit.laptopshop.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Location;
import vn.hoidanit.laptopshop.domain.User;

@Repository
public interface LocationReponsitory extends JpaRepository<Location, Long>{
    List<Location> findByUser(User user);
    Location findById(long id);
}
