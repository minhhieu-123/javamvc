package vn.hoidanit.laptopshop.controller.admin;


import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Notification;
import vn.hoidanit.laptopshop.domain.Products;
import vn.hoidanit.laptopshop.service.NotifycationService;
import vn.hoidanit.laptopshop.service.UploadService;


@Controller
public class NotifycationController {
    private final NotifycationService notifycationService;
    private final UploadService uploadService;
    public NotifycationController(NotifycationService notifycationService,UploadService uploadService) {
        this.notifycationService = notifycationService;
        this.uploadService=uploadService;
    }
    @GetMapping("/admin/notification")
    public String getDashboard(Model model){
        List<Notification> notifications = this.notifycationService.getAllNoti();
        model.addAttribute("notifications", notifications);
        return "admin/notification/table-notification";
    }
    @RequestMapping("/admin/notification/{notification_id}")
    public String getProDetailPage(Model model, @PathVariable long notification_id){
        Notification notification = this.notifycationService.getAllbyID(notification_id);
        model.addAttribute("notification_id", notification_id);
        model.addAttribute("notification", notification);
        return "admin/notification/view-notification";
    }
    @GetMapping("/admin/notification/create-notification")
    public String getCreateNotification(Model model){
        model.addAttribute("Notification", new Notification());
        return "admin/notification/create-notification";
    }
    @PostMapping("/admin/notification/create-notification")
    public String postCreateNotification(Model model, @ModelAttribute("Notification") @Valid  Notification notification,
    BindingResult bindingResult,@RequestParam("notificationFile") MultipartFile file){
            if (notification.getName() != null && !notification.getName().trim().isEmpty()) {
             if (notifycationService.checkBrandExist(notification.getName().trim())) {
                 bindingResult.rejectValue("name", "brand.name.exists",
                 "Tên thương hiệu '" + notification.getName() + "' đã tồn tại");
                }
            }
            if (bindingResult.hasErrors()){
                return "admin/notification/create-notification";
            }
        String avt = this.uploadService.handleSaveUploadFile(file, "notification");
        notification.setImage(avt);
        notification.setDate(LocalDateTime.now());
        this.notifycationService.handleSaveNotification(notification);
        System.out.println(notification);
        return "redirect:/admin/notification";
    }
    @PostMapping("/upload-image")
    @ResponseBody
    public Map<String, Object> uploadImage(@RequestParam("upload") MultipartFile file,
                                       HttpServletRequest request) throws IOException {
    // Tạo đường dẫn lưu ảnh
    String uploadDir = "uploads/";
    String realPath = request.getServletContext().getRealPath("/") + uploadDir;
    File dir = new File(realPath);
    if (!dir.exists()) dir.mkdirs();

    // Lưu file
    String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
    File uploadedFile = new File(dir, fileName);
    file.transferTo(uploadedFile);

    // Trả về URL ảnh để hiển thị trong CKEditor
    String imageUrl = request.getContextPath() + "/" + uploadDir + fileName;

    Map<String, Object> response = new HashMap<>();
    response.put("uploaded", 1);
    response.put("fileName", fileName);
    response.put("url", imageUrl);
    return response;
}
   
@RequestMapping("/admin/notification/update-notification/{id_brand}")
      public String getUpdatePage(Model model, @PathVariable long id_brand){
        Notification curent = this.notifycationService.getAllbyID(id_brand);
        model.addAttribute("Notification", curent);
        return "admin/notification/update-notification";
    }
    @PostMapping("/admin/notification/update-notification")
     public String postUpdatePage(Model model, @ModelAttribute("Notification") @Valid Notification notification,BindingResult bindingResult,@RequestParam("notificationFile") MultipartFile file){
         if (notification.getName() != null && !notification.getName().trim().isEmpty()) {
            if (notifycationService.checkBrandExistExcludingId(notification.getName().trim(), notification.getId())) {
                bindingResult.rejectValue("name", "brand.name.exists", 
                    "Tên thương hiệu '" + notification.getName() + "' đã tồn tại");
            }
        }
        if (bindingResult.hasErrors()){
            return "admin/notification/update-notification";
        }
        Notification curent = this.notifycationService.getAllbyID(notification.getId());
        model.addAttribute("newnotification", curent);
         if (curent != null) {
            if(!file.isEmpty()){
                String img = this.uploadService.handleSaveUploadFile(file, "notification");
                curent.setImage(img);
            }
            curent.setName(notification.getName());
            curent.setDetail_noti(notification.getDetail_noti());
            this.notifycationService.handleSaveNotification(curent);
        }
        return "redirect:/admin/notification";
     }
    // delete
    @GetMapping("/admin/notification/delete-notification/{id}")
    public String deleteBrandPage(Model model, @PathVariable long id){
        Notification notification = this.notifycationService.getAllbyID(id);
        model.addAttribute("notification", notification);
        model.addAttribute("Notification", new Notification());
        model.addAttribute("id", id);
        return "admin/notification/delete-notification";
    }

    @PostMapping(value = "/admin/notification/delete-notification")
     public String postDeleteBrandPage(Model model, @ModelAttribute("Notification") Notification notification){
        this.notifycationService.deleteNotificationbyID(notification.getId());
        return "redirect:/admin/notification";
    }
}
