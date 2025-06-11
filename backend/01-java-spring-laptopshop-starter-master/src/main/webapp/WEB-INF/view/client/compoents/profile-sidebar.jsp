 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="profile-sidebar" class="header">
    <aside class="profile__sidebar">
       <div class="profile-user">
           <img src="/client/assets/img/avt/Ellipse 61.png" alt="" class="profile-user__avt">
           <h1 class="profile-user__name">
               <span><c:out value="${sessionScope.fullName}"/></span>
           </h1>
           <span class="profile-user__desc">
               <span>Đăng ký ngày: 17/05/2025</span>
           </span>
       </div>
       <div class="profile-menu">
           <h3 class="profile-menu__title d-flex">
               <img src="/client/assets/icon/user.svg" alt="" class="profile-menu__icon">
               Quản lý tài khoản
           </h3>
           <ul class="profile-menu__list">
               <li >
                   <a href="/setting" class="profile-menu__link">Thông tin cá nhân</a>
               </li>
               <li>
                   <a href="/setting/shipping-location" class="profile-menu__link">Địa chỉ nhận hàng</a>
               </li>
               <li>
                   <a href="" class="profile-menu__link">Đổi mật khẩu</a>
               </li>
           </ul>
           
           <h3 class="profile-menu__title d-flex">
               <img src="/client/assets/icon/cart.svg" alt="" class="profile-menu__icon">
               Quản lý Sản Phẩm
           </h3>
           <ul class="profile-menu__list">
               <li >
                   <a href="/setting/info-checkout" class="profile-menu__link">Đơn mua</a>
               </li>
           </ul>
    
           <h3 class="profile-menu__title d-flex">
               <img src="/client/assets/icon/waring.svg" alt="" class="profile-menu__icon">
               Cài đặt
           </h3>
           <ul class="profile-menu__list">
               <li >
                   <a href="" class="profile-menu__link">Giao diện</a>
               </li>   
           </ul> 
       </div>
    </aside>
</div>
