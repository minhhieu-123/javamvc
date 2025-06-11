<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hieu Perfume</title>
    <link rel="icon" type="image/png" href="/client/assets/favicon/favicon-96x96.png" sizes="96x96" />
    <link rel="icon" type="image/svg+xml" href="/client/assets/favicon/favicon.svg" />
    <link rel="shortcut icon" href="/client/assets/favicon/favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="/client/assets/favicon/apple-touch-icon.png" />
    <link rel="manifest" href="/client/assets/favicon/site.webmanifest" />
    <!--  -->
    <!-- Font -->
    <link rel="stylesheet" href="/client/assets/fonts/stylesheet.css">
     <!--  -->
    <link rel="stylesheet" href="/client/css/main.css">
    <link rel="stylesheet" href="/client/css/modal.css">
</head>
<body>

    <jsp:include page="../compoents/headerHome.jsp" />
    <!--  -->
    <div class="container">
        <div class="profile-container">
            <div class="row">
                <div class="col-3">
                    <!-- profile-sidebar -->
                     <jsp:include page="../compoents/profile-sidebar.jsp" />
                    <!--  -->
                </div>
                <div class="col-9">
                    <div class="profile-content">
           <div class="prod-tab js-tabs">
    <ul class="prod-tab__list d-flex">
        <li class="prod-tab__item  no-padding prod-tab__item--current">Tất cả</li>
        <li class="prod-tab__item no-padding">Chờ xác nhận</li>
        <li class="prod-tab__item no-padding">Đang vận chuyển</li>
        <li class="prod-tab__item no-padding">Hoàn thành</li>
        <li class="prod-tab__item no-padding">Đã hủy</li>
    </ul>
    <div class="prod-tab__contents">
        <div class="prod-tab__content prod-tab__content--current">
            <c:forEach var="orders" items="${orders}">
                <c:if test="${orders.status != 'UN-CONFIRMED'}">
                    <div class="status-product d-flex">
                        <h3 class="cart-info__list-heading-title">Trạng thái đơn hàng</h3>
                        <span class="cart-info__list-heading-cost"><p>${orders.status}</p></span>
                    </div>
                    <c:forEach var="od" items="${orders.orderDetails}">
                    <div class="cart-info__list d-flex">
                                         <a class="cart-info__list-link" href="#">
                                             <img src="/admin/assets/product/${od.product.image}"class="cart-info__list-img" alt="" style="height: 100px; width: 100px; object-fit: cover; margin: 10px 10px;">
                                         </a>
                                         <div class="cart-info__list-content">
                                             <div class="cart-info__list-heading d-flex">
                                                 <h3 class="cart-info__list-heading-title">${od.product.name}</h3>
                                                 <span class="cart-info__list-heading-cost">
                                                    đ<fmt:formatNumber type="number" value=" ${od.price}"/>
                                                   </span>
                                             </div>
                                             <div class="cart-info__list-row d-flex">
                                         
                                             </div>
                                             <div class="cart-info__option d-flex" style="padding-bottom: 10px;">
                                                 <div class="cart-info__option-left d-flex">
                                                     <div class="cart-info__option-diff"></div>
                                                     <div class="cart-info__option-action d-flex justify-center">
                                                         Sô lượng: ${od.quantity}
                                                     </div>
                                                 </div>
                                                 
                                             </div>
                                         </div>
                                        </div>
                    </c:forEach>
                    <div class="d-flex  d-flex-space-betwen" >
                        <div class="d-flex-row">
                            <c:if test="${orders.date != null}">
                                <div>
                                    <p>Thời gian đặt hàng: ${orders.date}</p>
                                </div>
                            </c:if>
                            <c:if test="${orders.date_confirm != null}">
                                <div><p>Thời gian xác nhận: ${orders.date_confirm}</p></div>
                            </c:if>
                            <c:if test="${orders.date_complete != null}">
                                <div><p>Thời gian hoàn thành: ${orders.date_complete}</p></div>
                            </c:if>
                            <c:if test="${orders.date_cancel != null}">
                                <div><p>Thời gian hủy: ${orders.date_cancel}</p></div>
                            </c:if>
                        </div>
                        <div class="d-flex-row" style="justify-items: flex-end;">
                            <p class="cart-info__list-heading-cost " >Thành tiền: <fmt:formatNumber type="number" value="${orders.totalPrice}" /></p>
                            <form action="/pre-order/${orders.id}" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div >
                                    <button class="btn btn--danger btn--small" style="margin: 20px 0;">Mua lại</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <div class="prod-tab__content">
            <c:forEach var="orders" items="${orders}">
                <c:if test="${orders.status == 'UN-CONFIRMED'}">
                    <div class="status-product d-flex">
                        <h3 class="cart-info__list-heading-title">Trạng thái đơn hàng</h3>
                        <span class="cart-info__list-heading-cost"><p>${orders.status}</p></span>
                    </div>
                    <c:forEach var="od" items="${orders.orderDetails}">
                    <div class="cart-info__list d-flex">
                                         <a class="cart-info__list-link" href="#">
                                             <img src="/admin/assets/product/${od.product.image}"class="cart-info__list-img" alt="" style="height: 100px; width: 100px; object-fit: cover; margin: 10px 10px;">
                                         </a>
                                         <div class="cart-info__list-content">
                                             <div class="cart-info__list-heading d-flex">
                                                 <h3 class="cart-info__list-heading-title">${od.product.name}</h3>
                                                 <span class="cart-info__list-heading-cost">
                                                    đ<fmt:formatNumber type="number" value=" ${od.price}"/>                                                 
                                                  </span>
                                             </div>
                                             <div class="cart-info__list-row d-flex">
                                         
                                             </div>
                                             <div class="cart-info__option d-flex" style="padding-bottom: 10px;">
                                                 <div class="cart-info__option-left d-flex">
                                                     <div class="cart-info__option-diff"></div>
                                                     <div class="cart-info__option-action d-flex justify-center">
                                                         Sô lượng: ${od.quantity}
                                                     </div>
                                                 </div>
                                                 
                                             </div>
                                         </div>
                                        </div>
                    </c:forEach>
                    <div class="d-flex  d-flex-space-betwen" >
                        <div class="d-flex-row">
                            <c:if test="${orders.date != null}">
                                <div>
                                    <p>Thời gian đặt hàng: ${orders.date}</p>
                                </div>
                            </c:if>
                            <c:if test="${orders.date_confirm != null}">
                                <div><p>Thời gian xác nhận: ${orders.date_confirm}</p></div>
                            </c:if>
                            <c:if test="${orders.date_complete != null}">
                                <div><p>Thời gian hoàn thành: ${orders.date_complete}</p></div>
                            </c:if>
                            <c:if test="${orders.date_cancel != null}">
                                <div><p>Thời gian hủy: ${orders.date_cancel}</p></div>
                            </c:if>
                        </div>
                        <div class="d-flex-row" style="justify-items: flex-end;">
                            <p class="cart-info__list-heading-cost " >Thành tiền: <fmt:formatNumber type="number" value="${orders.totalPrice}" /></p>
                            <form action="/cancel-shipping/${orders.id}" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div >
                                    <button class="btn btn--danger btn--small" style="margin: 20px 0;">Hủy đơn hàng</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <div class="prod-tab__content">
            <c:forEach var="orders" items="${orders}">
                <c:if test="${orders.status == 'CONFIRM'}">
                    <div class="status-product d-flex">
                        <h3 class="cart-info__list-heading-title">Trạng thái đơn hàng</h3>
                        <span class="cart-info__list-heading-cost"><p>${orders.status}</p></span>
                    </div>
                    <c:forEach var="od" items="${orders.orderDetails}">
                    <div class="cart-info__list d-flex">
                                         <a class="cart-info__list-link" href="#">
                                             <img src="/admin/assets/product/${od.product.image}"class="cart-info__list-img" alt="" style="height: 100px; width: 100px; object-fit: cover; margin: 10px 10px;">
                                         </a>
                                         <div class="cart-info__list-content">
                                             <div class="cart-info__list-heading d-flex">
                                                 <h3 class="cart-info__list-heading-title">${od.product.name}</h3>
                                                 <span class="cart-info__list-heading-cost">
                                                    đ<fmt:formatNumber type="number" value=" ${od.price}"/>
                                                  </span>
                                             </div>
                                             <div class="cart-info__list-row d-flex">
                                         
                                             </div>
                                             <div class="cart-info__option d-flex" style="padding-bottom: 10px;">
                                                 <div class="cart-info__option-left d-flex">
                                                     <div class="cart-info__option-diff"></div>
                                                     <div class="cart-info__option-action d-flex justify-center">
                                                         Sô lượng: ${od.quantity}
                                                     </div>
                                                 </div>
                                                 
                                             </div>
                                         </div>
                                        </div>
                    </c:forEach>
                    <div class="d-flex  d-flex-space-betwen" >
                        <div class="d-flex-row">
                            <c:if test="${orders.date != null}">
                                <div>
                                    <p>Thời gian đặt hàng: ${orders.date}</p>
                                </div>
                            </c:if>
                            <c:if test="${orders.date_confirm != null}">
                                <div><p>Thời gian xác nhận: ${orders.date_confirm}</p></div>
                            </c:if>
                            <c:if test="${orders.date_complete != null}">
                                <div><p>Thời gian hoàn thành: ${orders.date_complete}</p></div>
                            </c:if>
                            <c:if test="${orders.date_cancel != null}">
                                <div><p>Thời gian hủy: ${orders.date_cancel}</p></div>
                            </c:if>
                        </div>
                        <div class="d-flex-row" style="justify-items: flex-end;">
                            <p class="cart-info__list-heading-cost " >Thành tiền: <fmt:formatNumber type="number" value="${orders.totalPrice}" /></p>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <div class="prod-tab__content">
            <c:forEach var="orders" items="${orders}">
                <c:if test="${orders.status == 'COMPLETE'}">
                    <div class="status-product d-flex">
                        <h3 class="cart-info__list-heading-title">Trạng thái đơn hàng</h3>
                        <span class="cart-info__list-heading-cost"><p>${orders.status}</p></span>
                    </div>
                    <c:forEach var="od" items="${orders.orderDetails}">
                    <div class="cart-info__list d-flex">
                                         <a class="cart-info__list-link" href="#">
                                             <img src="/admin/assets/product/${od.product.image}"class="cart-info__list-img" alt="" style="height: 100px; width: 100px; object-fit: cover; margin: 10px 10px;">
                                         </a>
                                         <div class="cart-info__list-content">
                                             <div class="cart-info__list-heading d-flex">
                                                 <h3 class="cart-info__list-heading-title">${od.product.name}</h3>
                                                 <span class="cart-info__list-heading-cost">
                                                    đ<fmt:formatNumber type="number" value=" ${od.price}"/>                                                    
                                                   </span>
                                             </div>
                                             <div class="cart-info__list-row d-flex">
                                         
                                             </div>
                                             <div class="cart-info__option d-flex" style="padding-bottom: 10px;">
                                                 <div class="cart-info__option-left d-flex">
                                                     <div class="cart-info__option-diff"></div>
                                                     <div class="cart-info__option-action d-flex justify-center">
                                                         Sô lượng: ${od.quantity}
                                                     </div>
                                                 </div>
                                                 
                                             </div>
                                         </div>
                                        </div>
                    </c:forEach>
                    <div class="d-flex  d-flex-space-betwen" >
                        <div class="d-flex-row">
                            <c:if test="${orders.date != null}">
                                <div>
                                    <p>Thời gian đặt hàng: ${orders.date}</p>
                                </div>
                            </c:if>
                            <c:if test="${orders.date_confirm != null}">
                                <div><p>Thời gian xác nhận: ${orders.date_confirm}</p></div>
                            </c:if>
                            <c:if test="${orders.date_complete != null}">
                                <div><p>Thời gian hoàn thành: ${orders.date_complete}</p></div>
                            </c:if>
                            <c:if test="${orders.date_cancel != null}">
                                <div><p>Thời gian hủy: ${orders.date_cancel}</p></div>
                            </c:if>
                        </div>
                        <div class="d-flex-row" style="justify-items: flex-end;">
                            <p class="cart-info__list-heading-cost " >Thành tiền: <fmt:formatNumber type="number" value="${orders.totalPrice}" /></p>
                            
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <div class="prod-tab__content">
            <c:forEach var="orders" items="${orders}">
                <c:if test="${orders.status == 'Fail' || orders.status == 'CANCEL'}">
                    <div class="status-product d-flex">
                        <h3 class="cart-info__list-heading-title">Trạng thái đơn hàng</h3>
                        <span class="cart-info__list-heading-cost"><p>${orders.status}</p></span>
                    </div>
                    <c:forEach var="od" items="${orders.orderDetails}">
                    <div class="cart-info__list d-flex">
                                         <a class="cart-info__list-link" href="#">
                                             <img src="/admin/assets/product/${od.product.image}"class="cart-info__list-img" alt="" style="height: 100px; width: 100px; object-fit: cover; margin: 10px 10px;">
                                         </a>
                                         <div class="cart-info__list-content">
                                             <div class="cart-info__list-heading d-flex">
                                                 <h3 class="cart-info__list-heading-title">${od.product.name}</h3>
                                                 <span class="cart-info__list-heading-cost">
                                                    đ<fmt:formatNumber type="number" value=" ${od.price}"/>
                                                    </span>
                                             </div>
                                             <div class="cart-info__list-row d-flex">
                                         
                                             </div>
                                             <div class="cart-info__option d-flex" style="padding-bottom: 10px;">
                                                 <div class="cart-info__option-left d-flex">
                                                     <div class="cart-info__option-diff"></div>
                                                     <div class="cart-info__option-action d-flex justify-center">
                                                         Sô lượng: ${od.quantity}
                                                     </div>
                                                 </div>
                                                 
                                             </div>
                                         </div>
                                        </div>
                    </c:forEach>
                    <div class="d-flex  d-flex-space-betwen" >
                        <div class="d-flex-row">
                            <c:if test="${orders.date != null}">
                                <div>
                                    <p>Thời gian đặt hàng: ${orders.date}</p>
                                </div>
                            </c:if>
                            <c:if test="${orders.date_confirm != null}">
                                <div><p>Thời gian xác nhận: ${orders.date_confirm}</p></div>
                            </c:if>
                            <c:if test="${orders.date_complete != null}">
                                <div><p>Thời gian hoàn thành: ${orders.date_complete}</p></div>
                            </c:if>
                            <c:if test="${orders.date_cancel != null}">
                                <div><p>Thời gian hủy: ${orders.date_cancel}</p></div>
                            </c:if>
                        </div>
                        <div class="d-flex-row" style="justify-items: flex-end;">
                            <p class="cart-info__list-heading-cost " >Thành tiền: <fmt:formatNumber type="number" value="${orders.totalPrice}" /></p>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <jsp:include page="../compoents/footerHome.jsp" />
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script src="/client/js/main.js"></script>
     <script src="/client/js/render.js"></script>
    <script>
    window.dispatchEvent(new Event("template-loaded"));
    </script>
</body>
</html>