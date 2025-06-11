package vn.hoidanit.laptopshop.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Categorys;

@Repository
public interface CategoryReponsitory extends JpaRepository<Categorys, Long>{
    Categorys save(Categorys brands);
    List<Categorys> findAll();
    Categorys findById(long id);
    Categorys deleteById(long id);
    Categorys findByName(String name);
    boolean existsByNameIgnoreCase(String name);
    boolean existsByNameIgnoreCaseAndIdNot(String name, Long id);
}
