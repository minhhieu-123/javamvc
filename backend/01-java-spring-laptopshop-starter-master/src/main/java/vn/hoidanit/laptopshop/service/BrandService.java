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
}
