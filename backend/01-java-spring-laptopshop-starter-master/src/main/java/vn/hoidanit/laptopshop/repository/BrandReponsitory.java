package vn.hoidanit.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Brands;

@Repository
public interface BrandReponsitory extends JpaRepository<Brands, Long>{
    Brands save(Brands brands);
    List<Brands> findAll();
    Brands findById(long id);
    void deleteById(long id);
    Brands findByName(String name);
}
