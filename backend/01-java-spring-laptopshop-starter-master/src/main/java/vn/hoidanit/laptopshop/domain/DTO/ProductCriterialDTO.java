package vn.hoidanit.laptopshop.domain.DTO;

import java.util.List;
import java.util.Optional;

import org.springframework.web.bind.annotation.RequestParam;

public class ProductCriterialDTO {
    private Optional<String> pageOptinal;
    private Optional<List<String>> brand;
    private Optional<List<String>> category;
    private Optional<List<String>> price;
    private Optional<List<String>> sort;
    private Optional<String> name;
    
    public Optional<String> getPageOptinal() {
        return pageOptinal;
    }
    public void setPageOptinal(Optional<String> pageOptinal) {
        this.pageOptinal = pageOptinal;
    }
    public Optional<List<String>> getBrand() {
        return brand;
    }
    public void setBrand(Optional<List<String>> brand) {
        this.brand = brand;
    }
    public Optional<List<String>> getCategory() {
        return category;
    }
    public void setCategory(Optional<List<String>> category) {
        this.category = category;
    }
    public Optional<List<String>> getPrice() {
        return price;
    }
    public void setPrice(Optional<List<String>> price) {
        this.price = price;
    }
    public Optional<List<String>> getSort() {
        return sort;
    }
    public void setSort(Optional<List<String>> sort) {
        this.sort = sort;
    }
    public Optional<String> getName() {
        return name;
    }
    public void setName(Optional<String> name) {
        this.name = name;
    }
    
    
}
