package vn.hoidanit.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Location;
import vn.hoidanit.laptopshop.domain.Notification;
import vn.hoidanit.laptopshop.domain.Products;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.DTO.NotiSummaryDTO;
import vn.hoidanit.laptopshop.service.NotifycationService;
import vn.hoidanit.laptopshop.service.OrderService;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class ProDetailController {
    private final ProductService productService;
    private final UserService userService;
    private final OrderService orderService;
    private final NotifycationService notifycationService;
    public ProDetailController(ProductService productService, UserService userService, OrderService orderService,NotifycationService notifycationService) {
        this.productService = productService;
        this.userService = userService;
        this.orderService = orderService;
        this.notifycationService=notifycationService;
    }
     @ModelAttribute("headerNotis")
    public List<NotiSummaryDTO> addNotiSummaryToHeader() {
        return notifycationService.getNotiSummaryDTOs();
    }
     @GetMapping("/thong-bao/{product_id}")
    public String getNoti(Model model, @PathVariable long product_id){
        Notification notification = this.notifycationService.getAllbyID(product_id);
        model.addAttribute("notification", notification);
     return "client/noti/index";
    }
    @GetMapping("/product/{product_id}")
    public String getProductDeatail(Model model, @PathVariable long product_id){
        Products product = this.productService.getUserByID(product_id);
        double a = product.getPrice();
        long b = product.getDiscount();
        double result;
        if (b == 0) {
            result = a;
        } else {
            result = a - (a * b / 100.0);
            if (result <0) {
                result = 0;
            }
        }
        model.addAttribute("result", result);
        System.out.println(result);
        model.addAttribute("product_id", product_id);
        model.addAttribute("product", product);
        return "client/pro/product";
    }
    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        long productid = id;
        String email =  (String)session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productid, session);
        return "redirect:/";
    }
    @PostMapping("/delete-product-to-cart/{id}")
    public String deleteProductToCart(@PathVariable long id, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        long cartDetailID = id;
        this.productService.deleteProductToCart(cartDetailID, session);
        request.getSession().setAttribute("message", "Xóa thành công!");
        return "redirect:/cart";
    }
    @GetMapping("/cart")
    public String getCartDetail(Model model, HttpServletRequest request){
          String message = (String) request.getSession().getAttribute("message");
        if (message != null) {
            model.addAttribute("message", message);
            request.getSession().removeAttribute("message");
        }
        HttpSession session = request.getSession(false);
        User currentUser = new User();
        long id = (long)session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null? new ArrayList<CartDetail>():cart.getCartDetails();

        double totalPrice=0;
        for(CartDetail cd : cartDetails){
            totalPrice+=cd.getPrice()*cd.getQuantity();
        }
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("cart", cart);
        return "client/cart/index";
    }
    @GetMapping("/checkout")
    public String getcheckout(Model model, HttpServletRequest request){
  
        HttpSession session = request.getSession(false);
        User currentUser = new User();
        long id = (long)session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null? new ArrayList<CartDetail>():cart.getCartDetails();

        double totalPrice=0;
        for(CartDetail cd : cartDetails){
            totalPrice+=cd.getPrice()*cd.getQuantity();
        }
        List<Location> lc = this.userService.fetchLocationByUser(currentUser);
        model.addAttribute("lcs", lc);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cartDetails", cartDetails);
        return "client/cart/confirm-checkout";
    }
     @PostMapping("/confirm-checkout")
    public String postUpdateQuanlityCheckout(Model model, @ModelAttribute("cart") Cart cart){
        List<CartDetail> cartDetails = cart == null? new ArrayList<CartDetail>():cart.getCartDetails();
        this.productService.handleUpdateQuantilyCart(cartDetails);
        model.addAttribute("cartDetails", cartDetails);
       
        return "redirect:/checkout";
    }
     @PostMapping("/place-order")
    public String postPlaceOrder(Model model,HttpServletRequest request, @RequestParam("address") long idlocation){
        HttpSession session = request.getSession(false);
        User currentUser = new User();
        long id = (long)session.getAttribute("id");
        currentUser.setId(id);
        this.orderService.handlePlaceOrder(idlocation, id, session);
        return "redirect:/";
    }
    
}
