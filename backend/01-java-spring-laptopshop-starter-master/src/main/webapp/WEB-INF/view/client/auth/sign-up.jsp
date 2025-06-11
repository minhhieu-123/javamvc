<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập | Hieu Perfume</title>
    <!-- favicon -->
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
    <script src="/client/js/main.js"></script>
    
</head>
<body>
    <main class="auth">
        <div class="auth__intro">
            
                <img src="/client/assets/img/login-up/intro.svg" alt=""  class="auth__intro-img">
            
            <p class="auth__intro-text">
                Chào mừng bạn đến cửa hàng. Những giá trị thương hiệu xa xỉ tốt nhất, sản phẩm chất lượng cao và dịch vụ sáng tạo
            </p>
        </div>

        <div class="auth__content">
            <div class="auth__content-inner">
                <a href="/" class="logo">
                    <img src="/client/assets/icon/logo.svg" alt="Hieu Perfume" class="logo_img_sign-up">
                    <h2 class="logo__title logo__title_sign-up">HieuPerfume</h2>
                </a>
                <h1 class="auth__heading">Đăng Ký</h1>
                <p class="auth__desc">Hãy tạo tài khoản và mua sắm như một người chuyên nghiệp và tiết kiệm tiền.</p>
                <form:form method="POST" action="/sign-up" class="form auth-form" modelAttribute="signupUser">
                     <c:set var="ErrorPass">
                        <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                    </c:set>
                    <c:set var="ErrorEmail">
                        <form:errors path="email" cssClass="invalid-feedback" />
                    </c:set>
                      <c:set var="ErrorName">
                        <form:errors path="fullName" cssClass="invalid-feedback" />
                    </c:set>
                     <div class="form__group">
                        <div class="form__text-input">
                            <form:input path="fullName" type="text" class="form__input" placeholder="Full Name"/>
                            <img src="/client/assets/icon/user.svg" alt="" class="form_icon">
                        </div>
                        ${ErrorName}
                    </div>

                    <div class="form__group">
                        <div class="form__text-input">
                            <form:input path="email" type="email" class=" form__input ${not empty ErrorEmail? 'is-invalid':''}" placeholder="Email"/>
                            <img src="/client/assets/icon/email.svg" alt="" class="form_icon">
                        </div>
                        ${ErrorEmail}
                    </div>

                    <div class="form__group">
                        <div class="form__text-input">
                            <form:input path="password" type="password" class=" form__input ${not empty ErrorPass? 'is-invalid':''}" placeholder="Password"/>
                            <img src="/client/assets/icon/password.svg" alt="" class="form_icon">
                        </div>
                        ${ErrorPass}
                    </div>

                    <div class="form__group">
                        <div class="form__text-input">
                            <form:input path="confirmPassword" type="password" class="form__input" placeholder="Confirm Password"/>
                            <img src="/client/assets/icon/password.svg" alt="" class="form_icon">
                        </div>
                    </div>

                    <div class="form__group form__group-inline" >
                        <label for="" class="form-checkbox">
                            <input type="checkbox" name="" id="" class="form__checkbox-input">
                            <span class="form__checkbox-label">Set as default card</span>
                        </label>
                        <!-- <a href="" class="auth__link  form__pull-right">Quên mật khẩu</a> -->
                    </div>
                    <div class="form__group auth__btn-group">
                        <button class="btn btn--primary auth__btn">Sign Up</button>
                        <button class="btn btn--outline auth__btn_1 btn--no-margin">
                            <img src="/client/assets/icon/google.svg" alt="">
                            Sign in with Gmail
                        </button>
                    </div>
                </form:form>

                <p class="auth__text">
                    Bạn đã có tài khoản rồi?
                    <a href="/sign-in" class="auth__link">Đăng nhập</a>
                </p>
            </div>
        </div>
   </main>
</body>
</html>