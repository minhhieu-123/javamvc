package vn.hoidanit.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Orders;
import vn.hoidanit.laptopshop.domain.User;

import java.util.List;


@Repository
public interface OrderReponsitory extends JpaRepository<Orders, Long>{
    Orders findById(long id);
    List<Orders> findByUser(User user);
}
