package vn.hoidanit.laptopshop.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "brand")
public class Brands {
      @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private long id;
     private String name;
    private String desc_cate;
    private String origin;
    private String image;
    @OneToMany(mappedBy = "brand")
    List<Products> products;
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
    public String getDesc_cate() {
        return desc_cate;
    }
    public void setDesc_cate(String desc_cate) {
        this.desc_cate = desc_cate;
    }
    public String getOrigin() {
        return origin;
    }
    public void setOrigin(String origin) {
        this.origin = origin;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public List<Products> getProducts() {
        return products;
    }
    public void setProducts(List<Products> products) {
        this.products = products;
    }
    @Override
    public String toString() {
        return "Brands [id=" + id + ", name=" + name + ", desc_cate=" + desc_cate + ", origin=" + origin + ", image="
                + image + ", products=" + products + "]";
    }
}
