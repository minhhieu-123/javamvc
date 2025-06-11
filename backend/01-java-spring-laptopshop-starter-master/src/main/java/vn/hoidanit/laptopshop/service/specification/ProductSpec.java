package vn.hoidanit.laptopshop.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.hoidanit.laptopshop.domain.Brands_;
import vn.hoidanit.laptopshop.domain.Categorys_;
import vn.hoidanit.laptopshop.domain.Products;
import vn.hoidanit.laptopshop.domain.Products_;

public class ProductSpec {
    public static Specification<Products> nameLike(String name){
        return (root, query, criteriaBuilder)
            -> criteriaBuilder.like(root.get(Products_.NAME), "%"+name+"%");
    }
    public static Specification<Products> matchBrandNames(List<String> brandNames) {
        return (root, query, criteriaBuilder) ->
            root.join(Products_.BRAND).get(Brands_.NAME).in(brandNames);
    }
    public static Specification<Products> matchCategoryNames(List<String> category) {
        return (root, query, criteriaBuilder) ->
            root.join(Products_.CATEGORY).get(Categorys_.NAME).in(category);
    }
    public static Specification<Products> matchPrice(double min, double max){
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(
            criteriaBuilder.ge(root.get(Products_.PRICE), min),
            criteriaBuilder.le(root.get(Products_.PRICE), max)
        );
    }
    public static Specification<Products> matchMultiplePrice(double min, double max){
        return(root, query, criteriaBuilder)->criteriaBuilder.between(root.get(Products_.PRICE), min, max);
    }
}
