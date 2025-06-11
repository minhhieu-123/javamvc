package vn.hoidanit.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Products;


@Repository
public interface ProductReponsitory extends JpaRepository<Products, Long>,JpaSpecificationExecutor<Products>{
    Products save(Products minhhieu);
    void deleteById(long id);
    Products findById(long id);
    Page<Products> findAll(Pageable page);
    Page<Products> findAll(Specification<Products> spec, Pageable page);
    Products findOneById(Products products);
    boolean existsByNameIgnoreCase(String name);
    boolean existsByNameIgnoreCaseAndIdNot(String name, Long id);
}
