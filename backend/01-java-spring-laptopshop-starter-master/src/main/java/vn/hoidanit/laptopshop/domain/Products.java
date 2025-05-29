package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "products")
public class Products {
      @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private long id;
    private String name;
    private double price;
    private String image;
    private String detailDesc;
    private String shortDesc;
    private long quantily;
    private long shold;
    private long discount;
    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brands brand;

     @ManyToOne
    @JoinColumn(name = "category_id")
    private Categorys category;

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

     @Override
     public String toString() {
        return "Products [id=" + id + ", name=" + name + ", price=" + price + ", image=" + image + ", detailDesc="
                + detailDesc + ", shortDesc=" + shortDesc + ", quantily=" + quantily + ", shold=" + shold
                + ", discount=" + discount + ", brand=" + brand + ", category=" + category + "]";
     }
}
