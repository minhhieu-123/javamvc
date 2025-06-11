package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Brands;
import vn.hoidanit.laptopshop.repository.BrandReponsitory;

@Service
public class BrandService {
    private final BrandReponsitory brandReponsitory;
    public BrandService(BrandReponsitory brandReponsitory) {
        this.brandReponsitory = brandReponsitory;
    }
    public List<Brands> getAllBrand(){
        return this.brandReponsitory.findAll();
    }
    public Brands handleSaveBrands(Brands brands){
        return this.brandReponsitory.save(brands);
    }
    public Brands getAllbyID(long id){
        return this.brandReponsitory.findById(id);
    }
    public void deleteBrandbyID(long id){
        this.brandReponsitory.deleteById(id);
    }
    
    
    public boolean checkBrandExist(String name) {
        if (name == null || name.trim().isEmpty()) {
            return false;
        }
        return brandReponsitory.existsByNameIgnoreCase(name.trim());
    }
    
    /**
     * Kiểm tra thương hiệu tồn tại ngoại trừ ID cụ thể (cho cập nhật)
     */
    public boolean checkBrandExistExcludingId(String name, Long excludeId) {
        if (name == null || name.trim().isEmpty()) {
            return false;
        }
        
        if (excludeId == null) {
            return checkBrandExist(name);
        }
        
        return brandReponsitory.existsByNameIgnoreCaseAndIdNot(name.trim(), excludeId);
    }
}
