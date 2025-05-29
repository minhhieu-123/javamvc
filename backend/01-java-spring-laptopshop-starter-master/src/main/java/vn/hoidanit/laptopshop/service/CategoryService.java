package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Categorys;
import vn.hoidanit.laptopshop.repository.CategoryReponsitory;

@Service
public class CategoryService {
    private final CategoryReponsitory categoryReponsitory;
    public CategoryService(CategoryReponsitory categoryReponsitory) {
        this.categoryReponsitory = categoryReponsitory;
    }
      public List<Categorys> getAllBrand(){
        return this.categoryReponsitory.findAll();
    }
    public Categorys handleSaveCategorys(Categorys categorys){
        return this.categoryReponsitory.save(categorys);
    }
    public Categorys getAllbyID(long id){
        return this.categoryReponsitory.findById(id);
    }
    public void deleteCategorybyID(long id){
        this.categoryReponsitory.deleteById(id);
    }
}
