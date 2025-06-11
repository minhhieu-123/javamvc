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
        <%
            String message = (String) request.getAttribute("message");
            if (message == null) message = "";
        %>
    <div id="toast" data-message="<%= message %>"></div>
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
                        <a href="${pageContext.request.contextPath}/cart" class="breadcrumbs__link" >
                            Giỏ hàng
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
                <th>Thao tác</th>
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
                            <div>
                                <button class="btn-minus">-</button>
                            </div>
                            <input type="text"
                            value="${cartDetail.quantity}"
                            data-cart-detail-id="${cartDetail.id}"
                            data-cart-detail-price="${cartDetail.price}"
                            data-cart-detail-index="${status.index}"
                            >
                            <div>
                                <button class="btn-plus">+</button>
                            </div>
                        </div>
                    </td>
                    <td>
                        <article data-cart-detail-id="${cartDetail.id}">
                            <fmt:formatNumber type="number" value="${cartDetail.price * cartDetail.quantity}" />đ
                        </article>
                    </td>
                    <td>
                        <form action="/delete-product-to-cart/${cartDetail.id}" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button class="btn btn--danger">Delete</button>
                        </form>
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
    </div>
    <c:if test="${! empty cartDetails}">
        <div class="home__container-product cart-sticky__footer">
            <div class="container">
                <div class="cart-group__info">
                    <a href="/" alt="">
                        <img src="/client/assets/icon/arrow-left.svg" alt="" class="cart-info__bottom-left-icon"> Tiếp tục mua sắm
                    </a>
                    <div class="d-flex">
                        <div class="cart-group__right">
                            <div class="row">Tạm tính (3 sản phẩm): 
                                <p data-cart-total-price="${totalPrice}">
                                    đ<fmt:formatNumber type="number" value="${totalPrice}"/></div>
                                </p>
                            <div class="row">Phí vận chuyển: </div>
                            <div class="row">Tổng: 
                                <p data-cart-total-price="${totalPrice}">
                                    đ<fmt:formatNumber type="number" value="${totalPrice}"/></div>
                                </p>
                            </div>
                        </div>
                        <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <div class="group-input-cart">
                                <div class="d-none">
                                    <c:forEach var="cartDetails" items="${cart.cartDetails}" varStatus="location">

                                        <form:input type="text" value="${cartDetails.id}" path="cartDetails[${location.index}].id"/>
                                        <form:input type="text" value="${cartDetails.quantity}" path="cartDetails[${location.index}].quantity"/>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="cart-group__left"><button class="btn btn--primary">Mua hàng</button></div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <script src="/client/js/render.js"></script>
    <jsp:include page="../compoents/footerHome.jsp" />


</body>
</html>