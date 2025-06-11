package vn.hoidanit.laptopshop.domain;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "orders")
public class Orders {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private long id;
    private String status;
    private LocalDateTime date;
    private LocalDateTime date_cancel;
    private LocalDateTime date_complete;
    private LocalDateTime date_confirm;
    private LocalDateTime date_fail;
    public LocalDateTime getDate_fail() {
        return date_fail;
    }
    public void setDate_fail(LocalDateTime date_fail) {
        this.date_fail = date_fail;
    }
    public LocalDateTime getDate_cancel() {
        return date_cancel;
    }
    public void setDate_cancel(LocalDateTime date_cancel) {
        this.date_cancel = date_cancel;
    }
    public LocalDateTime getDate_complete() {
        return date_complete;
    }
    public void setDate_complete(LocalDateTime date_complete) {
        this.date_complete = date_complete;
    }
    public LocalDateTime getDate_confirm() {
        return date_confirm;
    }
    public void setDate_confirm(LocalDateTime date_confirm) {
        this.date_confirm = date_confirm;
    }
    @ManyToOne()
    @JoinColumn(name ="location_id")
    private Location location;
    
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public Location getLocation() {
        return location;
    }
    public void setLocation(Location location) {
        this.location = location;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }
    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany( mappedBy = "order")
    List<OrderDetail> orderDetails;

    private double totalPrice;
    @Override
    public String toString() {
        return "Roles [id=" + id + ", totalPrice=" + totalPrice + "]";
    }
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public double getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    public LocalDateTime getDate() {
        return date;
    }
    public void setDate(LocalDateTime date) {
        this.date = date;
    }
}
