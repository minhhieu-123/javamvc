package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "products")
public class Products {
      @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private long id;
    @NotEmpty(message = "Name không được để trống")
    private String name;
    @NotNull(message = "Giá không được để trống")
    private double price;
    private String image;
    @NotEmpty(message = "Mô tả không được để trống")
    private String detailDesc;
    @NotEmpty(message = "Mô tả không được để trống")
    private String shortDesc;
    @NotNull(message = "số lượng không được để trống")
    private long quantily;
    private long shold;
    private long discount;
    @ManyToOne
    @NotNull(message = "Thương hiệu không được để trống")
    @JoinColumn(name = "brand_id")
    private Brands brand;

    @ManyToOne
    @NotNull(message = "Danh mục không được để trống")
    @JoinColumn(name = "category_id")
    private Categorys category;
        @Override
        public String toString() {
            return this.name != null ? this.name : "";
        }
     public long getId() {
         return id;
     }

     public void setId(long id) {
         this.id = id;
     }

     public String getName() {
         return name;
     }

     public void setName(String name) {
         this.name = name;
     }

     public double getPrice() {
         return price;
     }

     public void setPrice(double price) {
         this.price = price;
     }

     public String getImage() {
         return image;
     }

     public void setImage(String image) {
         this.image = image;
     }

     public String getDetailDesc() {
         return detailDesc;
     }

     public void setDetailDesc(String detailDesc) {
         this.detailDesc = detailDesc;
     }

     public String getShortDesc() {
         return shortDesc;
     }

     public void setShortDesc(String shortDesc) {
         this.shortDesc = shortDesc;
     }

     public long getQuantily() {
         return quantily;
     }

     public void setQuantily(long quantily) {
         this.quantily = quantily;
     }

     public long getShold() {
         return shold;
     }

     public void setShold(long shold) {
         this.shold = shold;
     }

     public Brands getBrand() {
         return brand;
     }

     public void setBrand(Brands brand) {
         this.brand = brand;
     }

     public Categorys getCategory() {
         return category;
     }

     public void setCategory(Categorys category) {
         this.category = category;
     }

     public long getDiscount() {
         return discount;
     }

     public void setDiscount(long discount) {
         this.discount = discount;
     }

  
}
