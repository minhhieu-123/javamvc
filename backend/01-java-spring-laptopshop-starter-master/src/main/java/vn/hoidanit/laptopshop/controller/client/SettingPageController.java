package vn.hoidanit.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Location;
import vn.hoidanit.laptopshop.domain.Orders;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.DTO.LocationDTO;
import vn.hoidanit.laptopshop.domain.DTO.NotiSummaryDTO;
import vn.hoidanit.laptopshop.repository.LocationReponsitory;
import vn.hoidanit.laptopshop.repository.OrderReponsitory;
import vn.hoidanit.laptopshop.service.NotifycationService;
import vn.hoidanit.laptopshop.service.OrderService;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class SettingPageController {
    private final OrderService orderService;
    private final LocationReponsitory locationReponsitory;
    private final UserService userService;
    private final OrderReponsitory orderReponsitory;
    private final ProductService productService;
    private final NotifycationService notifycationService;
    public SettingPageController(OrderService orderService, LocationReponsitory locationReponsitory,
        UserService userService, OrderReponsitory orderReponsitory,ProductService productService,NotifycationService notifycationService) {
      this.orderService = orderService;
      this.locationReponsitory = locationReponsitory;
      this.userService = userService;
      this.orderReponsitory=orderReponsitory;
      this.productService=productService;
      this.notifycationService=notifycationService;
    }
    @ModelAttribute("headerNotis")
    public List<NotiSummaryDTO> addNotiSummaryToHeader() {
        return notifycationService.getNotiSummaryDTOs();
    }
      @GetMapping("/setting/shipping-location")
    public String getSignIn(Model model, HttpServletRequest request){
        String message = (String) request.getSession().getAttribute("message");
        if (message != null) {
            model.addAttribute("message", message);
            request.getSession().removeAttribute("message");
        }
        HttpSession session = request.getSession(false);
        User currentUser = new User();
        long id = (long)session.getAttribute("id");
        currentUser.setId(id);
       List<Location> lc = this.userService.fetchLocationByUser(currentUser);
        model.addAttribute("lcs", lc);
        return "client/profile/shipping-location";
    }
  
    @PostMapping("/setting/shipping-location")
    public String saveAddress(Model model,@ModelAttribute LocationDTO locationDTO, HttpServletRequest request){
        HttpSession session = request.getSession(false);
         User currentUser = new User();
        long id = (long)session.getAttribute("id");
        currentUser.setId(id);
        String fullAddress = locationDTO.getDetailAdd() + ","+ locationDTO.getVillageAdd()+","+locationDTO.getDistrictAdd()+","+locationDTO.getProvinceAdd();
        Location location = new Location();
        location.setAddress(fullAddress);
        location.setName(locationDTO.getName());
        location.setPhone(locationDTO.getPhone());
        location.setNote(locationDTO.getNote());
        location.setUser(currentUser);
        locationReponsitory.save(location);
        List<Location> lc = this.userService.fetchLocationByUser(currentUser);
        model.addAttribute("lcs", lc);
        return "redirect:/setting/shipping-location";
    }
    @PostMapping("/delete-location/{id}")
    public String deleteLocation(@PathVariable long id,HttpServletRequest request ){
      this.locationReponsitory.deleteById(id);
      request.getSession().setAttribute("message", "Xóa thành công!");
      return "redirect:/setting/shipping-location";
    }
    @GetMapping("/setting")
    public String getSetting(Model model){
      return "client/profile/index";
    }
     @GetMapping("/setting/info-checkout")
    public String getInFoCheckout(Model model, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        User currentUser = new User();
        long id = (long)session.getAttribute("id");
        currentUser.setId(id);
        List<Orders> orders = this.orderService.getAllOrderByUserId(currentUser);
        model.addAttribute("orders", orders);
      return "client/profile/product-info";
    }
    @PostMapping("/cancel-shipping/{id}")
    public String cancelShipping(@PathVariable long id,HttpServletRequest request ){
      this.orderService.handleCancelShipping(id);
      return "redirect:/setting/info-checkout";
    }
    @PostMapping("/pre-order/{id}")
    public String postPreOrder(@PathVariable long id,HttpServletRequest request ){
        HttpSession session = request.getSession(false);
        long orderid = id;
        this.orderService.handleAddOrderToCart(orderid, session);
      return "redirect:/cart";
    }
}
