package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.hoidanit.laptopshop.domain.Brands;
import vn.hoidanit.laptopshop.domain.Categorys;
import vn.hoidanit.laptopshop.domain.Products;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;


@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService UploadService;
    public ProductController(ProductService productService,
            vn.hoidanit.laptopshop.service.UploadService uploadService) {
        this.productService = productService;
        UploadService = uploadService;
    }
    @GetMapping("/admin/product")
    public String getProduct(Model model){
        List<Products> products =this.productService.getAllUser();
        model.addAttribute("product", products);
        return "/admin/product/show";
    }
     @RequestMapping("/admin/product/{product_id}")
    public String getProDetailPage(Model model, @PathVariable long product_id){
        Products product = this.productService.getUserByID(product_id);
        model.addAttribute("product_id", product_id);
        model.addAttribute("product", product);
        return "admin/product/view-product";
    }
    @GetMapping("/admin/product/create-product")
    public String getCreateProPage(Model model){
        model.addAttribute("newProducts", new Products());
        List<Brands> brands = productService.getAllBrandsName();
        model.addAttribute("brand", brands);
        List<Categorys> Categorys = productService.getCategoryByName();
        model.addAttribute("category", Categorys);
        return "admin/product/create-product";
    }
     @PostMapping(value = "/admin/product/create-product")
     public String createProPage(Model model, @ModelAttribute("newProducts") Products Products, @RequestParam("productFile") MultipartFile file){
        String avt = this.UploadService.handleSaveUploadFile(file, "product");
        Products.setImage(avt);
        Products.setBrand(this.productService.getBrandByName(Products.getBrand().getId()));
        Products.setCategory(this.productService.getCategorysByName(Products.getCategory().getId()));
        this.productService.handleSaveUser(Products);
        return "redirect:/admin/product";
    }
    @RequestMapping("/admin/product/update-product/{product_id}")
    public String getUpdateProPage(Model model,  @PathVariable long product_id){
        List<Brands> brands = productService.getAllBrandsName();
        model.addAttribute("brand", brands);
        List<Categorys> Categorys = productService.getCategoryByName();
        model.addAttribute("category", Categorys);
        Products currentUser = this.productService.getUserByID(product_id);
        model.addAttribute("newProducts", currentUser);
        return "admin/product/update-product";
    }
     @PostMapping("/admin/product/update-product")
    public String postUpdateProductPage(Model model,  @ModelAttribute("newProduct") Products products){
        Products currentPro = this.productService.getUserByID(products.getId());
        model.addAttribute("newUsers", currentPro);
        if (currentPro != null) {
            currentPro.setName(products.getName());
            currentPro.setPrice(products.getPrice());
            currentPro.setDiscount(products.getDiscount());
            currentPro.setQuantily(products.getQuantily());
            currentPro.setBrand(products.getBrand());
            currentPro.setCategory(products.getCategory());
            currentPro.setDetailDesc(products.getDetailDesc());
            currentPro.setShortDesc(products.getShortDesc());
            this.productService.handleSaveUser(currentPro);
        }
        return "redirect:/admin/product";
    }
    @GetMapping("/admin/product/delete-product/{product_id}")
    public String deleteProPage(Model model,   @PathVariable long product_id){
        Products product = this.productService.getUserByID(product_id);
        model.addAttribute("product", product);
        model.addAttribute("newProducts", new Products());
        model.addAttribute("product_id", product_id);
        return "/admin/product/delete-product";
    }

    @PostMapping(value = "/admin/product/delete-product")
     public String postDeleteProPage(Model model, @ModelAttribute("newProducts") Products products){
        this.productService.deleteAllUser(products.getId());
        return "redirect:/admin/product";
    }
}
