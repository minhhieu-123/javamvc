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
                <h1 class="auth__heading">Đăng Nhập</h1>
                <p class="auth__desc">Chào mừng bạn quay lại để đăng nhập. Là khách hàng quay lại, bạn có thể truy cập vào tất cả thông tin đã lưu trước đó.</p>
                <form method="post" action="/sign-in" class="form auth-form">
                      <c:if test="${param.error != null}">
                                <div class="my-2" style="color: red;">Invalid email or password.</div>
                        </c:if>

                    <div class="form__group">
                        <div class="form__text-input">
                            <input type="text" class="form__input" placeholder="Email" name="username">
                            <img src="/client/assets/icon/email.svg" alt="" class="form_icon">
                        </div>
                    </div>

                    <div class="form__group">
                        <div class="form__text-input">
                            <input type="password" class="form__input" placeholder="Password" name="password">
                            <img src="/client/assets/icon/password.svg" alt="" class="form_icon">
                        </div>
                    </div>
                    <div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </div>
                    <div class="form__group form__group-inline" >
                        <label for="" class="form-checkbox">
                            <input type="checkbox" name="" id="" class="form__checkbox-input">
                            <span class="form__checkbox-label">Set as default card</span>
                        </label>
                        <a href="./sign-forgot-pss.html" class="auth__link  form__pull-right">Quên mật khẩu</a>
                    </div>
                    <div class="form__group auth__btn-group">
                        <button class="btn btn--primary auth__btn">Sign in</button>
                        <button class="btn btn--outline auth__btn_1 btn--no-margin">
                            <img src="/client/assets/icon/google.svg" alt="">
                            Sign in with Gmail
                        </button>
                    </div>
                </form>

                <p class="auth__text">
                    Bạn chưa có tài khoản?
                    <a href="/sign-up" class="auth__link">Đăng ký</a>
                </p>
            </div>
        </div>
   </main>
</body>
</html>