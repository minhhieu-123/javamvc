package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Brands;
import vn.hoidanit.laptopshop.domain.Categorys;
import vn.hoidanit.laptopshop.domain.Products;
import vn.hoidanit.laptopshop.repository.BrandReponsitory;
import vn.hoidanit.laptopshop.repository.CategoryReponsitory;
import vn.hoidanit.laptopshop.repository.ProductReponsitory;

@Service
public class ProductService {
    private ProductReponsitory productReponsitory;
    private BrandReponsitory brandReponsitory;
    private CategoryReponsitory categoryReponsitory;
    public ProductService(ProductReponsitory productReponsitory, BrandReponsitory brandReponsitory,
            CategoryReponsitory categoryReponsitory) {
        this.productReponsitory = productReponsitory;
        this.brandReponsitory = brandReponsitory;
        this.categoryReponsitory = categoryReponsitory;
    }
       public List<Products> getAllUser(){
        return this.productReponsitory.findAll();
    }
     public Products getUserByID(long id ){
        return this.productReponsitory.findById(id);
    }
    public Products handleSaveUser(Products user){
        return this.productReponsitory.save(user);
    }
      public void deleteAllUser(long id){
        this.productReponsitory.deleteById(id);;
    }
    public List<Brands> getAllBrandsName(){
        return this.brandReponsitory.findAll();
    }
     public List<Categorys> getCategoryByName(){
        return this.categoryReponsitory.findAll();
    }
      public Brands getBrandByName(long id){
        return this.brandReponsitory.findById(id);
    }
      public Categorys getCategorysByName(long id){
        return this.categoryReponsitory.findById(id);
    }
}
