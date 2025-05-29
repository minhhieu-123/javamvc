package vn.hoidanit.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Products;


@Repository
public interface ProductReponsitory extends JpaRepository<Products, Long>{
    Products save(Products minhhieu);
    void deleteById(long id);
    Products findById(long id);
    List<Products> findAll();

}
