package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Orders;
import vn.hoidanit.laptopshop.domain.Products;
import vn.hoidanit.laptopshop.service.OrderService;

@Controller
public class OrderController {
    private final OrderService orderService;
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getDashboard(Model model){
        List<Orders> orders =this.orderService.getAllOrders();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }
    @RequestMapping("/admin/order/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id){
        Orders orders = this.orderService.getOrderById(id);
        List<OrderDetail> orderDetail = this.orderService.getAllOrderDetailByid(orders.getId());
        model.addAttribute("orderDetails", orderDetail);
        model.addAttribute("orders", orders);

        return "admin/order/view-order";
    }
    @RequestMapping("/admin/order/update-order/{id}")
    public String getUpdateDetailPage(Model model, @PathVariable long id){
        Orders orders = this.orderService.getOrderById(id);
        model.addAttribute("orders", orders);
         model.addAttribute("newOrder", orders);
        return "admin/order/update-order";
    }
    @PostMapping("/admin/order/update-order")
    public String postUpdateDetailPage(Model model, @ModelAttribute("newOrder") Orders orders){
        Orders currentOreder = this.orderService.getOrderById(orders.getId());
        String newStatus = orders.getStatus();
        model.addAttribute("currentOreder", currentOreder);
        this.orderService.handleUpdateOrder(currentOreder,newStatus);
        return "redirect:/admin/order";
    }
    @GetMapping("/admin/order/delete-order/{id}")
    public String deleteOrder(Model model,   @PathVariable long id){
        model.addAttribute("newOrder", new Orders());
        model.addAttribute("id", id);
        return "admin/order/delete-order";
    }

    @PostMapping(value = "/admin/order/delete-order")
     public String postDeleteOrder(Model model, @ModelAttribute("newOrder") Orders orders){
        this.orderService.deleleOrderById(orders.getId());
        return "redirect:/admin/order";
    }

}
