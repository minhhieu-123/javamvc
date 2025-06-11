package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Brands;
// import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.BrandService;
import vn.hoidanit.laptopshop.service.UploadService;

@Controller
public class BrandController {
    private final BrandService brandService;
    private final UploadService uploadService;
      public BrandController(BrandService brandService, UploadService uploadService) {
        this.brandService = brandService;
        this.uploadService=uploadService;
    }
      @GetMapping("/admin/brand")
    public String getDashboard(Model model){
        List<Brands> brand = this.brandService.getAllBrand();
        model.addAttribute("brands", brand);
        return "admin/brand/table-brand";
    }
    // create
    @GetMapping("/admin/brand/create")
    public String getCreatePage(Model model){
        model.addAttribute("newbrand", new Brands());
        
        return "admin/brand/create-brand";
    }
    @PostMapping(value = "/admin/brand/create")
    public String createBrandPage(Model model, @ModelAttribute("newbrand") @Valid  Brands brands,
    BindingResult bindingResult,RedirectAttributes redirectAttributes,
     @RequestParam("brandFile") MultipartFile file){
         if (brands.getName() != null && !brands.getName().trim().isEmpty()) {
             if (brandService.checkBrandExist(brands.getName().trim())) {
                 bindingResult.rejectValue("name", "brand.name.exists",
                 "Tên thương hiệu '" + brands.getName() + "' đã tồn tại");
                }
            }
            if (bindingResult.hasErrors()){
                return "admin/brand/create-brand";
            }
        // try {
        //     brandService.updateBrand(brands);
        //     redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thương hiệu thành công!");
        // } catch (Exception e) {
        //     redirectAttributes.addFlashAttribute("errorMessage", "Lỗi khi cập nhật thương hiệu.");
        // }
        String avt = this.uploadService.handleSaveUploadFile(file, "brand");
        brands.setImage(avt);
        Brands brand= this.brandService.handleSaveBrands(brands);
        System.out.println(brand);
        return "redirect:/admin/brand";
    }
    //edit
    @RequestMapping("/admin/brand/update-brand/{id_brand}")
      public String getUpdatePage(Model model, @PathVariable long id_brand){
        Brands curent = this.brandService.getAllbyID(id_brand);
        model.addAttribute("newbrand", curent);
        return "admin/brand/edit-brand";
    }
    @PostMapping("/admin/brand/update-brand")
     public String postUpdatePage(Model model, @ModelAttribute("newbrand") @Valid Brands brands,BindingResult bindingResult,@RequestParam("brandFile") MultipartFile file){
         if (brands.getName() != null && !brands.getName().trim().isEmpty()) {
            if (brandService.checkBrandExistExcludingId(brands.getName().trim(), brands.getId())) {
                bindingResult.rejectValue("name", "brand.name.exists", 
                    "Tên thương hiệu '" + brands.getName() + "' đã tồn tại");
            }
        }
        if (bindingResult.hasErrors()){
            return "admin/brand/update-brand";
        }
        Brands curent = this.brandService.getAllbyID(brands.getId());
        model.addAttribute("newbrand", curent);
         if (curent != null) {
            if(!file.isEmpty()){
                String img = this.uploadService.handleSaveUploadFile(file, "brand");
                curent.setImage(img);
            }
            curent.setName(brands.getName());
            curent.setDesc_cate(brands.getDesc_cate());
            curent.setOrigin(brands.getOrigin());
            this.brandService.handleSaveBrands(curent);
        }
        System.out.println(brands);
        return "redirect:/admin/brand";
     }
    // delete
    @GetMapping("/admin/brand/delete-brand/{id_brand}")
    public String deleteBrandPage(Model model, @PathVariable long id_brand){
        Brands brands = this.brandService.getAllbyID(id_brand);
        model.addAttribute("brands", brands);
        model.addAttribute("newbrand", new Brands());
        model.addAttribute("id_brand", id_brand);
        return "admin/brand/delete-brand";
    }

    @PostMapping(value = "/admin/brand/delete-brand")
     public String postDeleteBrandPage(Model model, @ModelAttribute("newbrand") Brands brands){
        this.brandService.deleteBrandbyID(brands.getId());
        return "redirect:/admin/brand";
    }
}
