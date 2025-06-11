package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Categorys;
import vn.hoidanit.laptopshop.service.CategoryService;
import vn.hoidanit.laptopshop.service.UploadService;

@Controller
public class CategoryController {
    private final CategoryService categoryService;
    private final UploadService uploadService;
    public CategoryController(CategoryService categoryService, UploadService uploadService) {
        this.categoryService = categoryService;
        this.uploadService = uploadService;
    }
        @GetMapping("/admin/category")
    public String getDashboard(Model model){
        List<Categorys> category = this.categoryService.getAllBrand();
        model.addAttribute("categorys", category);
        return "admin/category/table-cate";
    }
    // create
    @GetMapping("/admin/category/create")
    public String getCreatePage(Model model){
        model.addAttribute("newCategory", new Categorys());
        return "admin/category/create-cate";
    }
    @PostMapping(value = "/admin/category/create")
    public String createCategoryPage(Model model, @ModelAttribute("newCategory") @Valid Categorys categorys,BindingResult bindingResult ,@RequestParam("categoryFile") MultipartFile file){
        if (categorys.getName() != null && !categorys.getName().trim().isEmpty()) {
             if (categoryService.checkBrandExist(categorys.getName().trim())) {
                 bindingResult.rejectValue("name", "brand.name.exists",
                 "Tên thương hiệu '" + categorys.getName() + "' đã tồn tại");
                }
            }
            if (bindingResult.hasErrors()){
                return "admin/category/create-cate";
            }
        String avt = this.uploadService.handleSaveUploadFile(file, "category");
        categorys.setImage(avt);
        Categorys category= this.categoryService.handleSaveCategorys(categorys);
        System.out.println(category);
        return "redirect:/admin/category";
    }
    //edit
    @RequestMapping("/admin/category/update-category/{id_category}")
      public String getUpdatePage(Model model, @PathVariable long id_category){
        Categorys curent = this.categoryService.getAllbyID(id_category);
        model.addAttribute("newCategory", curent);
        return "admin/category/edit-cate";
    }
    @PostMapping("/admin/category/update-category")
     public String postUpdatePage(Model model, @ModelAttribute("newCategory") @Valid Categorys categorys,BindingResult bindingResult ,@RequestParam("categoryFile") MultipartFile file){
         if (categorys.getName() != null && !categorys.getName().trim().isEmpty()) {
            if (categoryService.checkBrandExistExcludingId(categorys.getName().trim(), categorys.getId())) {
                bindingResult.rejectValue("name", "brand.name.exists", 
                    "Tên thương hiệu '" + categorys.getName() + "' đã tồn tại");
            }
        }
        if (bindingResult.hasErrors()){
            return "admin/category/edit-cate";
        }
        Categorys curent = this.categoryService.getAllbyID(categorys.getId());
        model.addAttribute("newCategory", curent);
         if (curent != null) {
             if(!file.isEmpty()){
                String img = this.uploadService.handleSaveUploadFile(file, "category");
                curent.setImage(img);
            }
            curent.setName(categorys.getName());
            curent.setSlug(categorys.getSlug());
            this.categoryService.handleSaveCategorys(curent);
        }
        return "redirect:/admin/category";
     }
    // delete
    @GetMapping("/admin/category/delete-category/{id_category}")
    public String deletecategoryPage(Model model, @PathVariable long id_category){
        Categorys categorys = this.categoryService.getAllbyID(id_category);
        model.addAttribute("categorys", categorys);
        model.addAttribute("newCategory", new Categorys());
        model.addAttribute("id_category", id_category);
        return "admin/category/delete-cate";
    }

    @PostMapping(value = "/admin/category/delete-category")
     public String postDeletecategoryPage(Model model, @ModelAttribute("newCategory") Categorys categorys){
        this.categoryService.deleteCategorybyID(categorys.getId());
        return "redirect:/admin/category";
    }
}
