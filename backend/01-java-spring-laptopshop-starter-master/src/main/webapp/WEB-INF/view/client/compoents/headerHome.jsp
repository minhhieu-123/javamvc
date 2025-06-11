 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <header id="header" class="header header-home">
     <div class="container">
         <div class="top-bar-login">
             <div class="top-bar-login-left">
                 <nav class="navbar">
                     <ul class="navbar-list">
                         <li>
                             <a href="" class="navbar-link">
                                 Kết Nối
                                 <img src="/client/assets/icon/instagram.svg" alt="" class="navbar__heart">
                                 <img src="/client/assets/icon/messeger.svg" alt="" class="navbar__heart">
                             </a>
                         </li>
                         <div class="partition">
                             <!-- | -->
                         </div>
                         <li>
                             <a href="" class="navbar-link">
                                 <img src="/client/assets/icon/sercurity.svg" alt="" class="navbar__heart">
                                 Chính Sách
                             </a>
                         </li>
                     </ul>
                  </nav>
             </div>
             <div class="top-bar-login-right">
                 <nav class="navbar">
                     <ul class="navbar-list">
                        <!--  -->
                         <li class="navbar-link__heart-hover ">
                             <div href="" class="navbar-link">
                                 <img src="/client/assets/icon/heart.svg" alt="" class="navbar__heart">
                                 Thông báo
                             </div>
                             <div class="act-dropdown__heart act-dropdown">
                            <div class="act-dropdown__icon ">
                                <img class="act-dropdown__icon-img act-dropdown__icon-img-large" src="/client/assets/icon/arrow-up-img.png" alt="">
                            </div>
                            <div class="act-dropdown__inner">
                                <div class="act-dropdown__top">
                                    <h2 class="act-dropdown__title">Thông báo mới nhất</h2>
                                </div>
                
                                <div class="cart-preview__item">
                                    <div class="cart-preview__exception d-none">
                                        <div class="cart-preview__btn-group">
                                            <button class="btn btn--danger ">
                                                <a href="">Tiếp tục mua sắm</a>
                                            </button>
                                        </div>
                                    </div>
                                    <!--  -->
                                    <c:forEach var="noNotiSummaryDTOs" items="${headerNotis}">
                                        <a href="/thong-bao/${noNotiSummaryDTOs.id}" target="_blank" class="cart-preview__product d-flex">
                                            <div class="cart-preview__thumb">
                                                <img src="/admin/assets/notification/${noNotiSummaryDTOs.image}" alt=""class="cart-preview__img">
                                            </div>
                                            <div class="cart-preview__name">
                                                <span>${noNotiSummaryDTOs.name}</span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                    <!--  -->
                                </div>
                                <div class="cart-preview__btn-group">
                                </div>
                            </div>
                        </div>
                            </li>
                         <div class="partition">
                             <!-- | -->
                         </div>
                         <li>
                             <a href="" class="navbar-link">
                                 <img src="/client/assets/icon/earch.svg" alt="" class="navbar__heart" srcset="">
                                 Tiếng Việt
                                 <img src="/client/assets/icon/arow.svg" alt="" class="navbar__arrow">
                             </a>
                         </li>
                          <div class="partition">
                             <!-- | -->
                         </div>
                         <c:choose>
                                    <c:when test="${not empty pageContext.request.userPrincipal}">
                                        <li class="navbar-link__user-hover ">
                                           <div  class="navbar-link">
                                               <img src="/client/assets/img/avt/Ellipse 61.png" alt="" class="navbar__img-avt">
                                               <span> <c:out value="${sessionScope.fullName}"/>
                                           </div>
                                           <div class="act-dropdown__user act-dropdown">
                                               <div class="act-dropdown__icon">
                                                   <img class="act-dropdown__icon-img act-dropdown__icon-img-small" src="/client/assets/icon/arrow-up-img.png" alt="">
                                               </div>
                                               <div class="act-dropdown__inner-user act-dropdown__inner">
                                               <ul class="user-menu__list">
                                                   <li>
                                                       <a href="/setting" class="user-menu__link">
                                                       Cài đặt
                                                   </a>
                                               </li>
                                                   <li>
                                                    <form action="/logout" method="post">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                        <button href="" class="user-menu__link">
                                                        Đăng xuất
                                                        </button>
                                                    </form>
                                               </li>
                                               </ul>
                                               </div>
                                           </div>
                                       </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                             <a href="/sign-up" class="navbar-link">
                                                 Đăng Ký
                                             </a>
                                         </li>
                                         <div class="partition">
                                         </div>
                                         <li>
                                             <a href="/sign-in" class="navbar-link">
                                                 Đăng Nhập
                                             </a>
                                         </li>
                                    </c:otherwise>
                        </c:choose>
                     </ul>
                  </nav>
             </div>
         </div>
         <div class="top-bar">
             <!-- More -->
              <div class="top-bar_more">
                 <img src="/client/assets/icon/more.svg" alt="" class="top-bar_more-icon">
              </div>
             <!-- logo -->
             <a href="/" class="logo">
                 <img src="/client/assets/icon/logo.svg" alt="Hieu Perfume" class="logo">
                 <h2 class="logo__title">HieuPerfume</h2>
             </a>
             <!-- search -->
             <div class="search">
                 <input type="search" name="" id="search-input" placeholder="Tìm sản phẩm, thương hiệu" class="search-input">
                 <button id="search-btn">
                     <img src="/client/assets/icon/search.svg" alt="" class="search-icon">
                 </button>
             </div>
                  <script src="/client/js/search.js"></script>

             <!-- <nav class="navbar">
                <ul class="navbar-list">
                    <li>
                        <a href="" class="navbar-link">
                            Sản phẩm
                            <img src="/client/assets/icon/arow.svg" alt="" class="navbar__arrow">
                        </a>
                    </li>
                    <li>
                        <a href="" class="navbar-link">
                            Thương hiệu
                            <img src="/client/assets/icon/arow.svg" alt="" class="navbar__arrow">
                        </a>
                    </li>
                </ul>
             </nav> -->
             <!-- navbar -->
             <!-- Option -->
             <div class="top-option-cart">
                 <a href="/cart" class="right-cart">
                     <img src="/client/assets/icon/cart.svg" alt="">
                    </a>
                    <c:if test="${not empty pageContext.request.userPrincipal}">
                        <div class="right-cart-title">${sessionScope.sum}</div>
                    </c:if>
             </div>
         </div>
     </div>
 </header>