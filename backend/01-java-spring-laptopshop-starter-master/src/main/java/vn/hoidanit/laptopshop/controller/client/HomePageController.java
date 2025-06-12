package vn.hoidanit.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Brands;
import vn.hoidanit.laptopshop.domain.Categorys;
import vn.hoidanit.laptopshop.domain.Products;
import vn.hoidanit.laptopshop.domain.DTO.NotiSummaryDTO;
import vn.hoidanit.laptopshop.domain.DTO.ProductCriterialDTO;
import vn.hoidanit.laptopshop.domain.DTO.RegisterDTO;
import vn.hoidanit.laptopshop.service.BrandService;
import vn.hoidanit.laptopshop.service.CategoryService;
import vn.hoidanit.laptopshop.service.NotifycationService;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final BrandService brandService;
    private final CategoryService categoryService;
    private final UserService userService;
     private final PasswordEncoder passwordEncoder;
     private final NotifycationService notifycationService;
     public HomePageController(ProductService productService, BrandService brandService,
            CategoryService categoryService, UserService userService, PasswordEncoder passwordEncoder, NotifycationService notifycationService) {
        this.productService = productService;
        this.brandService = brandService;
        this.categoryService = categoryService;
        this.userService=userService;
        this.passwordEncoder=passwordEncoder;
        this.notifycationService=notifycationService;
    }

    @ModelAttribute("headerNotis")
    public List<NotiSummaryDTO> addNotiSummaryToHeader() {
        return notifycationService.getNotiSummaryDTOs();
    }
      @GetMapping("/all-product")
    public String getAllProduct(Model model, ProductCriterialDTO productCriterialDTO
    ){
        int page = 1;
        try{
            if(productCriterialDTO.getPageOptinal().isPresent()){
                page = Integer.parseInt((productCriterialDTO.getPageOptinal().get()));
            }
            else{}
        } catch(Exception e){
        }
        Pageable pageable = PageRequest.of(page-1, 60);
        List<Brands> brand = this.brandService.getAllBrand();
        model.addAttribute("brands", brand);
        List<Categorys> category = this.categoryService.getAllBrand();
        model.addAttribute("categorys", category);
        Page<Products> products =this.productService.getAllProduct(pageable, productCriterialDTO);
        List<Products> listProduct = products.getContent().size()>0?products.getContent():new ArrayList<Products>();
        model.addAttribute("product", listProduct);
        model.addAttribute("currentpage", page);
        model.addAttribute("totalpage", products.getTotalPages());
        return "client/homepage/all-product";
    }
     @GetMapping("/")
    public String getDashboard(Model model){
        // List<Products> products =this.productService.getAllUser();
        Pageable pageable =PageRequest.of(0,12);
        Page<Products> prs =this.productService.getAllUser(pageable);
        List<Products> products = prs.getContent();
        model.addAttribute("product", products);
        List<Brands> brand = this.brandService.getAllBrand();
        model.addAttribute("brands", brand);
        List<Categorys> category = this.categoryService.getAllBrand();
        model.addAttribute("categorys", category);
        return "client/homepage/index";
    }
    //  @GetMapping("/sign-up")
    // public String getSignUp(Model model){
    //     model.addAttribute("signupUser", new RegisterDTO());
    //     Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    // if (auth != null && auth.isAuthenticated()
    //     && !(auth instanceof AnonymousAuthenticationToken)) {
    //     // Người dùng đã đăng nhập
    //     return "redirect:/"; // hoặc trang bạn muốn
    // }
    //     return "client/auth/sign-up";
    // }
    //   @PostMapping("/sign-up")
    // public String handleSignup(@ModelAttribute("signupUser") @Valid RegisterDTO registerDTO,
    //     BindingResult bindingResult){
    //     // List<FieldError> errors = bindingResult.getFieldErrors();
    //     // for (FieldError error : errors ) {
    //     //     System.out.println (error.getField() + " - " + error.getDefaultMessage());
    //     // }
    //     if(bindingResult.hasErrors()){
    //         return "client/auth/sign-up";
    //     }
    //     User user = this.userService.signupDTOUser(registerDTO);
    //     String hashPassword = this.passwordEncoder.encode(user.getPassworld());
    //     user.setPassworld(hashPassword);
    //     user.setRole(this.userService.getRoleByName("USER"));
    //     this.userService.handleSaveUser(user);
    //     return "redirect:/sign-in";
    // }
    @GetMapping("/sign-in")
   public String getSignIn(Model model,HttpServletRequest request){
   Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   if (auth != null && auth.isAuthenticated()
       && !(auth instanceof AnonymousAuthenticationToken)) {
       // Người dùng đã đăng nhập
       return "redirect:/"; 
   }
       return "client/auth/sign-in";
   }
    @GetMapping("/sign-up")
    public String getSignUp(Model model) {
        model.addAttribute("signupUser", new RegisterDTO());
        return "client/auth/sign-up";
    }
    @PostMapping("/sign-up")
    public String postSignUp(@Valid @ModelAttribute("signupUser") RegisterDTO registerDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes){
           if (bindingResult.hasErrors()) {
            return "client/auth/sign-up";
        }
        try {
            userService.registerUser(registerDTO);
            redirectAttributes.addFlashAttribute("message", 
                "Đăng ký thành công! Vui lòng kiểm tra email để xác thực tài khoản.");
            return "redirect:/sign-in";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/sign-up";
        }
    }
    @GetMapping("/verify-email")
    public String verifyEmail(@RequestParam("token") String token,
                             RedirectAttributes redirectAttributes) {
        try {
            boolean isVerified = this.userService.verifyEmail(token);
            if (isVerified) {
                redirectAttributes.addFlashAttribute("message", 
                    "Xác thực email thành công! Bạn có thể đăng nhập ngay bây giờ.");
                return "redirect:/login";
            } else {
                redirectAttributes.addFlashAttribute("error", 
                    "Token không hợp lệ hoặc đã hết hạn.");
                return "redirect:/login";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", 
                "Có lỗi xảy ra khi xác thực email: " + e.getMessage());
            return "redirect:/login";
        }
    }
    @PostMapping("/resend-verification")
    public String resendVerification(@RequestParam("email") String email,
                                   RedirectAttributes redirectAttributes) {
        try {
            userService.resendVerificationEmail(email);
            redirectAttributes.addFlashAttribute("message", 
                "Email xác thực đã được gửi lại. Vui lòng kiểm tra hộp thư.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        
        return "redirect:/sign-in";
    }
       @GetMapping("/access-deny")
    public String getDenyPage(Model model){
        return "client/auth/deny";
    }
}
