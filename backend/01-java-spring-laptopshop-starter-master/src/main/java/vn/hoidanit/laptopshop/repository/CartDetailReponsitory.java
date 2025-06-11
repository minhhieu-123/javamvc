package vn.hoidanit.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Products;
import java.util.List;



@Repository
public interface CartDetailReponsitory extends JpaRepository<CartDetail, Long>{
    boolean existsByCartAndProducts(Cart cart, Products product);
    CartDetail findByCartAndProducts(Cart cart, Products product);
    void deleteById(long id);
    CartDetail findById(long id);
    List<CartDetail> findByCart(Cart cart);

}
