package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Brands;
import vn.hoidanit.laptopshop.domain.Notification;
import vn.hoidanit.laptopshop.domain.DTO.NotiSummaryDTO;
import vn.hoidanit.laptopshop.repository.NotifycationReponsitory;


@Service
public class NotifycationService {
    private final NotifycationReponsitory notifycationReponsitory;
    
    public NotifycationService(NotifycationReponsitory notifycationReponsitory) {
        this.notifycationReponsitory = notifycationReponsitory;
    }
    public List<Notification> getAllNoti(){
        return this.notifycationReponsitory.findAll();
    }
    public Notification handleSaveNotification(Notification notification){
        return this.notifycationReponsitory.save(notification);
    }
    public Notification getAllbyID(long id){
        return this.notifycationReponsitory.findById(id);
    }
    public void deleteNotificationbyID(long id){
        this.notifycationReponsitory.deleteById(id);
    }
    
    
    public boolean checkBrandExist(String name) {
        if (name == null || name.trim().isEmpty()) {
            return false;
        }
        return notifycationReponsitory.existsByNameIgnoreCase(name.trim());
    }
    
    /**
     * Kiểm tra thương hiệu tồn tại ngoại trừ ID cụ thể (cho cập nhật)
     */
    public boolean checkBrandExistExcludingId(String name, Long excludeId) {
        if (name == null || name.trim().isEmpty()) {
            return false;
        }
        
        if (excludeId == null) {
            return checkBrandExist(name);
        }
        
        return notifycationReponsitory.existsByNameIgnoreCaseAndIdNot(name.trim(), excludeId);
    }
    public List<NotiSummaryDTO> getNotiSummaryDTOs(){
        return this.notifycationReponsitory.findAllWithoutDetailNoti();
    }
}


