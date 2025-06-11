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
                        <div class="profile-content__heading">
                                Địa chỉ giao hàng hiện tại
                        </div>
                        <!--dia chi giao hang -->
                    <c:forEach var="lc" items="${lcs}">
                        <div class="address-card d-flex">
                            <div class="address-card__left d-flex" >
                                <div action="" class="address-card__choose">
                                    *
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
                            <form action="/delete-location/${lc.id}" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button class="btn btn--danger btn--small">
                                    Xóa
                                </button>
                            </form>
                            </div>
                        </div>
<!-- toggle sua -->
                         

                    </c:forEach>
                        <%
                        String message = (String) request.getAttribute("message");
                        if (message == null) message = "";
                        %>
                        <div id="toast" data-message="<%= message %>"></div>

                        <!--  -->
                        <div class="profile-content__heading">
                                Thêm địa chỉ giao hàng mới
                        </div>
                        <!--  -->

                        <form:form action="/setting/shipping-location" method="post" modelAttribute="locationDTO">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="cart-confirm__group-input d-flex">
                                            <label for="" class="cart-confirm__label">Tên người nhận</label>
                                            <input type="text" name="name" class="cart-confirm__input form-default" placeholder="VD: Nguyễn Văn A">
                                        </div>
                                        <div class="cart-confirm__group-input d-flex">
                                            <label for="" class="cart-confirm__label">Tỉnh thành
                                                <select name="provinceAdd" id="province" class="cart-confirm__select">
                                                    <option value="">Chọn tỉnh / thành phố</option>
                                                </select>
                                            </label>
                                        </div>
                                        <div class="cart-confirm__group-input d-flex">
                                            <label for="" class="cart-confirm__label">Phường xã
                                                <select name="villageAdd" id="ward" class="cart-confirm__select">
                                                    <option value="">Chọn phường / xã</option>
                                                 </select>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="cart-confirm__group-input d-flex">
                                            <label for="" class="cart-confirm__label">Số điện thoại</label>
                                            <input type="text" name="phone" class="cart-confirm__input form-default" placeholder="VD: 0123456789">
                                        </div>
                                        <div class="cart-confirm__group-input d-flex">
                                            <label for="" class="cart-confirm__label">Quận huyện</label>
                                            <select name="districtAdd" id="district" class="cart-confirm__select">
                                                <option value="">Chọn quận/ huyện</option>
                                            </select>
                                        </div>
                                        <div class="cart-confirm__group-input d-flex">
                                            <label for="" class="cart-confirm__label">Địa chỉ chi tiết</label>
                                            <input type="text" name="detailAdd" class="cart-confirm__input form-default" placeholder="Nhập số nhà, tên đường">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                         <div class="cart-confirm__group-input d-flex">
                                            <label for="" class="cart-confirm__label">Ghi chú</label>
                                            <textarea name="note" id="" placeholder="Ghi chú đơn hàng" class="cart-confirm__textarea"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <!-- script api tinh thanh pho -->
                                <script src="/client/js/api.js"></script>
                                <div class="profile-content__group-btn justify-center">
                            <button class="btn btn--danger">Lưu</button>
                        </div>
                        </form:form>
                        
                        <!--  -->
                    </div>
                </div>
            </div>
        </div>
    </div>
     <jsp:include page="../compoents/footerHome.jsp" />
     <script src="/client/js/main.js"></script>
     <script src="/client/js/render.js"></script>
    <script>
    window.dispatchEvent(new Event("template-loaded"));
    </script>
</body>
</html>