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
    <link rel="stylesheet" href="/client/css/cart.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/client/js/main.js"></script>
</head>
<body>
    <jsp:include page="../compoents/headerHome.jsp" />
    <!--  -->
    <div class="container">
        <!-- breadcrumbs -->
        <div class="home__container-product">
            <div class="breadcrumbs">
                <ul class="breadcrumbs__list">
                    <li>
                        <a href="${pageContext.request.contextPath}/" class="breadcrumbs__link" >
                            Hieu Perfume
                            <img src="/client/assets/icon/arow-right.svg" class="breadcrumbs__link-icon" alt="">
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/confirm-checkout" class="breadcrumbs__link" >
                            Thanh Toán
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Product -->
        <div class="home__container-product">
    <c:choose>
        <c:when test="${empty cartDetails}">
            <div class="cart-no-product justify-center" style="flex-direction: column;">
                <p class="justify-center" style="font-size: 20px; font-weight: 500;">Chưa có sản phẩm nào được thêm <a href="/" class="btn btn--primary" style="margin-left: 20px;">Tiếp tục mua sắm</a></p>
                <img class="cart-preview__no-product-img" src="/client/assets/img/drop-down/buy-continue.png" alt="">
            </div>
        </c:when>
        <c:otherwise>
            <table class="table">
            <thead>
                <tr>
                <th>Sản phẩm</th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th>Số tiền</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                <tr>
                    <td>
                        <a href="/product/${cartDetail.products.id}" class="table__group" target="_blank">
                            <img src="/admin/assets/product/${cartDetail.products.image}" alt="" class="table__img">
                            <p class="table__name-product">${cartDetail.products.name}</p>
                        </a>
                    </td>
                    <td><p>
                        <fmt:formatNumber type="number" value="${cartDetail.price}"/>
                    </p></td>
                    <td>
                        <div class="quantity-control quantity">
                            <input type="text"
                            value="${cartDetail.quantity}"
                            data-cart-detail-id="${cartDetail.id}"
                            data-cart-detail-price="${cartDetail.price}"
                            data-cart-detail-index="${status.index}"
                            >
                        </div>
                    </td>
                    <td>
                        <article data-cart-detail-id="${cartDetail.id}">
                            <fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity}" />đ
                        </article>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            </table>
        </c:otherwise>
    </c:choose>
            <!-- Nút tạo user -->

        </div>
        <!-- Product Content -->
         <div class="checkout__container">
            <div class="row">
                <div class="col-8 col-xl-12">
                    <form:form method="post" action="/place-order" class="cart-confirm">
                        <div class="cart-confirm__heading">
                            Thông tin đặt hàng
                        </div>
                            <c:forEach var="lc" items="${lcs}">
                                <div class="address-card d-flex">
                                    <div class="address-card__left d-flex" >
                                        <div action="" class="address-card__choose">
                                            <input type="radio" name="address" value="${lc.id}">
                                        </div>
                                        <div class="address-card__info d-flex">
                                            <span class="address-card__info-name">
                                                <p>${lc.name}</p>
                                            </span>
                                            <span class="address-card__info-address">
                                                <p id="location-text">${lc.address}</p>
                                            </span>
                                            <span class="address-card__info-numberphone">
                                                <p>${lc.phone}</p>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="address-card__right">
                                    </div>
                                </div>
                            </c:forEach>
                         <div class="cart-confirm__heading cart-confirm__heading-option">
                            Phương thức thanh toán
                        </div>
                        <div class="cart-confirm__option d-flex">
                            <label for="">
                                <input type="radio" name="" id="">
                                Thanh toán khi nhận hàng
                            </label>
                            <label for="">
                                <input type="radio" name="" id="">
                                Thanh toán trực tiếp bằng tài khoản ngân hàng quá ví VNPAY
                            </label>
                        </div>
                            <button class="btn btn--primary btn--small">Thanh toán</button>
                    </form:form>
                </div>
                <div class="col-4 col-xl-12">
                    <div class="cart-info">
                        <div class="cart-info__row">
                             <div class="cart-info__bottom-row cart-info__bill">
                                <span>Tạm tính:</span>
                                <p data-cart-total-price="${totalPrice}">
                                    đ<fmt:formatNumber type="number" value="${totalPrice}"/></div>
                                </p>
                            </div>
                             <div class="cart-info__bottom-row cart-info__bill">
                                <span>Vận chuyển</span>
                                <span>$30000</span>
                            </div>
                            <div class="checkout-stick checkout-stick-row"></div>
                             <div class="cart-info__bottom-row" style="font-size: 24px;">
                                <span>Cần thanh toán</span>
                                <span>$30000</span>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <jsp:include page="../compoents/footerHome.jsp" />


</body>
</html>