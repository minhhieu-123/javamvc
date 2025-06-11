package vn.hoidanit.laptopshop.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Orders;

import java.util.List;


@Repository
public interface OrderDetailReponsitory extends JpaRepository<OrderDetail, Long>{
    List<OrderDetail> findByOrderId(long id);
}
