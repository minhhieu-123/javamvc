package vn.hoidanit.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Notification;
import vn.hoidanit.laptopshop.domain.DTO.NotiSummaryDTO;

@Repository
public interface NotifycationReponsitory extends JpaRepository<Notification, Long>{
    Notification findById(long id);
    boolean existsByNameIgnoreCase(String name);
    boolean existsByNameIgnoreCaseAndIdNot(String name, Long id);
    @Query("SELECT new vn.hoidanit.laptopshop.domain.DTO.NotiSummaryDTO(n.id, n.name, n.date, n.image) FROM Notification n")
    List<NotiSummaryDTO> findAllWithoutDetailNoti();

}
