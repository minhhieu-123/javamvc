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
                        <div class="profile-content justify-center">
                            <img src="/client/assets/img/avt/Ellipse 61.png" alt="" class="profile-content-img">
                        </div>
                        <div class="profile-content-group d-flex">
                            <label class="cart-confirm__label">Email: </label>
                            <p><c:out value="${sessionScope.email}"/></p>
                        </div>
                        <div class="profile-content-group d-flex">
                            <label class="cart-confirm__label">Tên: </label>
                            <p><c:out value="${sessionScope.fullName}"/></p>
                        </div>
                        <div class="profile-content-group d-flex">
                            <label class="cart-confirm__label">SĐT: </label>
                            <p><c:out value="${sessionScope.phone}"/></p>
                        </div>
                        <div class="profile-content-group d-flex">
                            <label class="cart-confirm__label">Địa chỉ: </label>
                            <p><c:out value="${sessionScope.address}"/></p>
                        </div>
                        <button class="btn btn--primary btn--small">Cập nhật</button>
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