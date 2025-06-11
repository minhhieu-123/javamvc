package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Brands;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Categorys;
import vn.hoidanit.laptopshop.domain.Products;
import vn.hoidanit.laptopshop.domain.Products_;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.DTO.ProductCriterialDTO;
import vn.hoidanit.laptopshop.repository.BrandReponsitory;
import vn.hoidanit.laptopshop.repository.CartDetailReponsitory;
import vn.hoidanit.laptopshop.repository.CartReponsitory;
import vn.hoidanit.laptopshop.repository.CategoryReponsitory;
import vn.hoidanit.laptopshop.repository.ProductReponsitory;
import vn.hoidanit.laptopshop.service.specification.ProductSpec;

@Service
public class ProductService {
    private final ProductReponsitory productReponsitory;
    private final BrandReponsitory brandReponsitory;
    private final CategoryReponsitory categoryReponsitory;
    private final CartReponsitory cartReponsitory;
    private final CartDetailReponsitory cartDetailReponsitory;
    private final UserService userService;
    public ProductService(ProductReponsitory productReponsitory, BrandReponsitory brandReponsitory,
            CategoryReponsitory categoryReponsitory, CartReponsitory cartReponsitory,
            CartDetailReponsitory cartDetailReponsitory, UserService userService) {
        this.productReponsitory = productReponsitory;
        this.brandReponsitory = brandReponsitory;
        this.categoryReponsitory = categoryReponsitory;
        this.cartReponsitory = cartReponsitory;
        this.cartDetailReponsitory = cartDetailReponsitory;
        this.userService = userService;
    }
     public boolean checkProductExist(String name) {
        if (name == null || name.trim().isEmpty()) {
            return false;
        }
        return productReponsitory.existsByNameIgnoreCase(name.trim());
    }
    
    /**
     * Kiểm tra thương hiệu tồn tại ngoại trừ ID cụ thể (cho cập nhật)
     */
    public boolean checkProductExistExcludingId(String name, Long excludeId) {
        if (name == null || name.trim().isEmpty()) {
            return false;
        }
        
        if (excludeId == null) {
            return checkProductExist(name);
        }
        
        return productReponsitory.existsByNameIgnoreCaseAndIdNot(name.trim(), excludeId);
    }
    public Page<Products> getAllProduct(Pageable pageable, ProductCriterialDTO productCriterialDTO){
        if(productCriterialDTO.getCategory() == null && productCriterialDTO.getBrand()==null && productCriterialDTO.getPrice()==null && productCriterialDTO.getName()==null){
            return this.productReponsitory.findAll(pageable);
        }
        Specification<Products> comninSpecification = Specification.where(null);
        if (productCriterialDTO.getCategory() != null && productCriterialDTO.getCategory().isPresent()) {
            Specification<Products> currentSpecs = ProductSpec.matchCategoryNames(productCriterialDTO.getCategory().get());
            comninSpecification =comninSpecification.and(currentSpecs);
        }
        if (productCriterialDTO.getBrand() != null && productCriterialDTO.getBrand().isPresent()) {
            Specification<Products> currentSpecs = ProductSpec.matchBrandNames(productCriterialDTO.getBrand().get());
            comninSpecification =comninSpecification.and(currentSpecs);
        }
        if (productCriterialDTO.getPrice() != null && productCriterialDTO.getPrice().isPresent()) {
            Specification<Products> currentSpecs = this.buildPrice(productCriterialDTO.getPrice().get());
            comninSpecification =comninSpecification.and(currentSpecs);
        }
        if (productCriterialDTO.getName() != null && productCriterialDTO.getName().isPresent()) {
            Specification<Products> currentSpecs = ProductSpec.nameLike(productCriterialDTO.getName().get());
            comninSpecification =comninSpecification.and(currentSpecs);
        }
        return this.productReponsitory.findAll(comninSpecification, pageable);
    }
    
    // public Page<Products> getAllProduct(Pageable pageable, List<String> name){
    //     return this.productReponsitory.findAll(ProductSpec.matchBrandNames(name), pageable);
    // }
    //  public Page<Products> getAllProduct(Pageable pageable, List<String> name){
    //     return this.productReponsitory.findAll(ProductSpec.matchCategoryNames(name), pageable);
    // }
    // public Page<Products> getAllProduct(Pageable pageable, String name){
    //     return this.productReponsitory.findAll(ProductSpec.cate(name), pageable);
    // }
    // public Page<Products> getAllProduct(Pageable pageable, String name){
    //     return this.productReponsitory.findAll(ProductSpec.brand(name), pageable);
    // }
    // public Page<Products> getAllProduct(Pageable pageable, double price){
    //     return this.productReponsitory.findAll(ProductSpec.maxPrice(price), pageable);
    // }
    // public Page<Products> getAllProduct(Pageable pageable, double price){
    //     return this.productReponsitory.findAll(ProductSpec.minPrice(price), pageable);
    // }
    // case 5
    // public Page<Products> getAllProduct(Pageable pageable, String price){
    //     if (price.equals("duoi-500k")) {
    //         double min = 0;
    //         double max = 500000;
    //         return this.productReponsitory.findAll(ProductSpec.matchPrice(min,max), pageable);
    //     } else if(price.equals("duoi-1-trieu")){
    //          double min = 0;
    //         double max = 1000000;
    //         return this.productReponsitory.findAll(ProductSpec.matchPrice(min,max), pageable);
    //     }
    //     else if(price.equals("duoi-5-trieu")){
    //          double min = 0;
    //         double max = 5000000;
    //         return this.productReponsitory.findAll(ProductSpec.matchPrice(min,max), pageable);
    //     }
    //      else return this.productReponsitory.findAll(pageable);
    // }
 public Specification<Products> buildPrice(List<String> price) {
    // Start with a false predicate (empty disjunction)
    Specification<Products> combines = (root, query, criteriaBuilder) -> 
        criteriaBuilder.disjunction();
    
    // Return early if price list is null or empty
    if (price == null || price.isEmpty()) {
        return combines;
    }
    
    for (String p : price) {
        double min = 0;
        double max = 0;
        
        switch (p) {
            case "duoi-500k":
                min = 0;
                max = 500000;
                break;
            case "duoi-1-trieu":
                min = 0;
                max = 1000000;
                break;
            case "duoi-5-trieu":
                min = 0;
                max = 5000000;
                break;
            case "1-trieu-5-trieu":
                min = 1000000;
                max = 5000000;
                break;
            case "tren-5-trieu":
                min = 5000000;
                max = Double.MAX_VALUE;
                break;
            default:
                // Skip unknown price ranges
                continue;
        }
        
        // Create range specification and combine with OR
        Specification<Products> rangeSpec = ProductSpec.matchMultiplePrice(min, max);
        combines = combines.or(rangeSpec);
    }
    
    return combines;
}
    public Page<Products> getAllUser(Pageable pageable){
        return this.productReponsitory.findAll(pageable);
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
    public void handleAddProductToCart(String eamil, long productid, HttpSession session){
        User user = this.userService.getUserByEmail(eamil);
        if ((user != null)) {
            Cart cart = this.cartReponsitory.findByUser(user);
            if (cart == null) {
                //tao moi cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);
                cart = this.cartReponsitory.save(otherCart);
            }
            //tim product by id
            Products products = this.productReponsitory.findById(productid);
            if (products != null) {
                //check san pham da co trong gio hang chua
                CartDetail oldDetail = this.cartDetailReponsitory.findByCartAndProducts(cart, products);
                if(oldDetail == null){
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProducts(products);
                    cartDetail.setPrice(products.getPrice() - (products.getPrice() * products.getDiscount()/100));
                    cartDetail.setQuantity(1);
                    this.cartDetailReponsitory.save(cartDetail);
                    // update sum
                    // if () {
                        int s = cart.getSum()+1;
                        cart.setSum(s);
                        this.cartReponsitory.save(cart);
                        session.setAttribute("sum", s);
                }else{
                    oldDetail.setQuantity(oldDetail.getQuantity() +1);
                    this.cartDetailReponsitory.save(oldDetail);
                }
            }
        }
    }
    public Cart fetchByUser(User user){
        return this.cartReponsitory.findByUser(user);
    }
    public CartDetail fetechCartDetailByID(long id){
        return this.cartDetailReponsitory.findById(id);
    }
    public void deleteProductToCartDetail(long id){
        this.cartDetailReponsitory.deleteById(id);
    }
     public void deleteProductToCart( long idCartDetail, HttpSession session){
        CartDetail cartDetail = this.fetechCartDetailByID(idCartDetail);
        Cart cart = cartDetail.getCart();
        this.cartDetailReponsitory.deleteById(idCartDetail);
        int sumCart = cart.getSum();
        if(sumCart>1){
            int s = sumCart-1;
            cart.setSum(s);
            this.cartReponsitory.save(cart);
            session.setAttribute("sum", s);
        }
        else if(sumCart == 1){
            this.cartReponsitory.deleteById(cart.getId());

            sumCart=0;
            cart.setSum(sumCart);
            this.cartReponsitory.save(cart);
            session.setAttribute("sum", sumCart);
        }
    }
    public void handleUpdateQuantilyCart(List<CartDetail> cartDetails){
        for(CartDetail cartDetail:cartDetails){
            CartDetail cdOptional = this.cartDetailReponsitory.findById(cartDetail.getId());
            if (cdOptional != null) {
                cdOptional.setQuantity(cartDetail.getQuantity());
                this.cartDetailReponsitory.save(cdOptional);
            }
        }
    }
}
