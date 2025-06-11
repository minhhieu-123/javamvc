package vn.hoidanit.laptopshop.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Location;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Orders;
import vn.hoidanit.laptopshop.domain.Products;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.CartDetailReponsitory;
import vn.hoidanit.laptopshop.repository.CartReponsitory;
import vn.hoidanit.laptopshop.repository.OrderDetailReponsitory;
import vn.hoidanit.laptopshop.repository.OrderReponsitory;
import vn.hoidanit.laptopshop.repository.ProductReponsitory;

@Service
public class OrderService {
    private final ProductReponsitory productReponsitory;
    private final CartReponsitory cartReponsitory;
    private final CartDetailReponsitory cartDetailReponsitory;
    private final UserService userService;
    private final OrderReponsitory orderReponsitory;
    private final OrderDetailReponsitory orderDetailReponsitory;
    private final ProductService productService;
   public OrderService(ProductReponsitory productReponsitory, CartReponsitory cartReponsitory,
            CartDetailReponsitory cartDetailReponsitory, UserService userService, OrderReponsitory orderReponsitory,
            OrderDetailReponsitory orderDetailReponsitory, ProductService productService) {
        this.productReponsitory = productReponsitory;
        this.cartReponsitory = cartReponsitory;
        this.cartDetailReponsitory = cartDetailReponsitory;
        this.userService = userService;
        this.orderReponsitory = orderReponsitory;
        this.orderDetailReponsitory = orderDetailReponsitory;
        this.productService=productService;
    }
    public List<Orders> getAllOrderByUserId(User user){
        return this.orderReponsitory.findByUser(user);
    }
    public List<OrderDetail> getAllOrderDetailByid(long id){
        return this.orderDetailReponsitory.findByOrderId(id);
    }
    public List<Orders> getAllOrders(){
        return this.orderReponsitory.findAll();
    }
    public void deleleOrderById(long id){
        List<OrderDetail> orderDetails= getAllOrderDetailByid(id);
        for(OrderDetail od : orderDetails){
            orderDetailReponsitory.deleteById(od.getId());
        }
        this.orderReponsitory.deleteById(id);
    }
    public Orders getOrderById(long id){
        return this.orderReponsitory.findById(id);
    }
    public void handleCancelShipping(long id){
        Orders orders = this.orderReponsitory.findById(id);
        orders.setStatus("CANCEL");
        List<OrderDetail> orderDetail = getAllOrderDetailByid(orders.getId());
        for(OrderDetail od : orderDetail){
            Products product = od.getProduct();
            if (product != null) {
            long updatedQuantity = product.getQuantily() + od.getQuantity();
            product.setQuantily(updatedQuantity);
            productReponsitory.save(product);
        }
        }
        orders.setDate_cancel(LocalDateTime.now());
        this.orderReponsitory.save(orders);
    }
    public void handleUpdateOrder(Orders orders,String newStatus){
        if(orders != null){
            orders.setStatus(newStatus);
            switch (newStatus) {
                case "CONFIRM":
                    orders.setDate_confirm(LocalDateTime.now());
                    break;
                case "COMPLETE":
                {
                    orders.setDate_complete(LocalDateTime.now());
                    List<OrderDetail> orderDetail = getAllOrderDetailByid(orders.getId());
                        for(OrderDetail od : orderDetail){
                            Products product = od.getProduct();
                            if (product != null) {
                            long updatedQuantity = product.getShold() + od.getQuantity();
                            product.setShold(updatedQuantity);
                            productReponsitory.save(product);
                        }
                    }
                }
                    break;
                case "Fail":
                    {
                        List<OrderDetail> orderDetail = getAllOrderDetailByid(orders.getId());
                        for(OrderDetail od : orderDetail){
                            Products product = od.getProduct();
                            if (product != null) {
                            long updatedQuantity = product.getQuantily() + od.getQuantity();
                            product.setQuantily(updatedQuantity);
                            productReponsitory.save(product);
                        }
                        }
                        orders.setDate_fail(LocalDateTime.now());
                    }
                    break;
                case "CANCEL":
                   {
                       List<OrderDetail> orderDetail = getAllOrderDetailByid(orders.getId());
                        for(OrderDetail od : orderDetail){
                            Products product = od.getProduct();
                            if (product != null) {
                            long updatedQuantity = product.getQuantily() + od.getQuantity();
                            product.setQuantily(updatedQuantity);
                            productReponsitory.save(product);
                        }
                        }
                       orders.setDate_cancel(LocalDateTime.now());
                    }
                    break;
            }
            this.orderReponsitory.save(orders);
        }
    }
   public void handlePlaceOrder(long id_location,long id_user,HttpSession session){
        Location location = this.userService.getLocationById(id_location);
        User user = this.userService.getUserByID(id_user);
        Cart cart = this.cartReponsitory.findByUser(user);
        if ((user != null)){
            Orders newOrders = new Orders();
            newOrders.setLocation(location);
            newOrders.setStatus("UN-CONFIRMED");
            newOrders.setUser(user);
            this.orderReponsitory.save(newOrders);
            newOrders.setDate(LocalDateTime.now());
            List<CartDetail> cartDetails = this.cartDetailReponsitory.findByCart(cart);
            if(cartDetails != null){
                double total=0;
                for(CartDetail cd : cartDetails){
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(newOrders);
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    orderDetail.setProduct(cd.getProducts());
                    this.orderDetailReponsitory.save(orderDetail);
                    total += orderDetail.getPrice() * orderDetail.getQuantity();

                    Products product = orderDetail.getProduct();
                    if (product.getQuantily() > orderDetail.getQuantity()) {
                        long updatedQuantity = product.getQuantily() - orderDetail.getQuantity();
                        product.setQuantily(updatedQuantity);
                        productReponsitory.save(product);
                    }
                }
                for(CartDetail cd : cartDetails){
                    cartDetailReponsitory.deleteById(cd.getId()); // xóa khỏi giỏ hàng
                 }
                this.cartReponsitory.deleteById(cart.getId());
                session.setAttribute("sum", 0);
                newOrders.setTotalPrice(total);
                this.orderReponsitory.save(newOrders);
                total=0;
            }

        }

   }
   public void handleAddOrderToCart(long orderid, HttpSession session){
    User currentUser = new User();
    long id = (long)session.getAttribute("id");
    currentUser.setId(id);
    List<OrderDetail> orderDetails= getAllOrderDetailByid(orderid);
    for(OrderDetail od : orderDetails){
        long idproduct = od.getProduct().getId();
        String email = (String)session.getAttribute("email");
        this.productService.handleAddProductToCart(email, idproduct, session);
    }
    }
}
