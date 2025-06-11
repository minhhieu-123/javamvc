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
                        <a href="" class="breadcrumbs__link" >
                            Hieu Perfume
                            <img src="/client/assets/icon/arow-right.svg" class="breadcrumbs__link-icon" alt="">
                        </a>
                    </li>
                    <li>
                        <a href="" class="breadcrumbs__link" >
                            ${product.category.name}
                            <img src="/client/assets/icon/arow-right.svg" class="breadcrumbs__link-icon" alt="">
                        </a>
                    </li>
                    <li>
                        <a href="" class="breadcrumbs__link" >
                            ${product.brand.name}
                            <img src="/client/assets/icon/arow-right.svg" class="breadcrumbs__link-icon" alt="">
                        </a>
                    </li>
                    <li>
                        <a href="" class="breadcrumbs__link" >
                             ${product.name}
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Product -->
        <div class="home__container-product">
            <div class="row home__product-detail">
                <div class="col-5 col-xl-6 col-lg-12">
                    <div class="prod-preview ">
                        <div class="prod-preview__list ">
                            <div class="prod-preview__item ">
                                <img src="/admin/assets/product/${products.image}" alt="" class="prod-preview__img">
                            </div>
                            <div class="prod-preview__item">
                                <img src="/client/assets/img/product-page/image - UIHUT.png" alt="" class="prod-preview__img">
                            </div>
                            <div class="prod-preview__item">
                                <img src="/client/assets/img/product-page/image - UIHUT.png" alt="" class="prod-preview__img">
                            </div>
                            <div class="prod-preview__item">
                                <img src="/client/assets/img/product-page/image - UIHUT.png" alt="" class="prod-preview__img">
                            </div>
                        </div>
                        <div class="prod-preview__thumbs justify-center">
                            <img src="/admin/assets/product/${products.image}" alt="" class="prod-preview__thumbs-img prod-preview__thumbs-img-current">
                            <img src="/client/assets/img/product-page/image - UIHUT.png" alt="" class="prod-preview__thumbs-img">
                            <img src="/client/assets/img/product-page/image - UIHUT.png" alt="" class="prod-preview__thumbs-img">
                            <img src="/client/assets/img/product-page/image - UIHUT.png" alt="" class="prod-preview__thumbs-img">
                        </div>
                    </div>
                </div>
                <div class="col-7 col-xl-6 col-lg-12">
                    <section class="prod-info">
                        <div class="prod-info__reverse_mobile">
                            <div class="prod-info__heading-group">
                                <h1 class="prod-info__heading">
                                   ${product.name}
                                </h1>
                                <div class="prod-info__props ">
                                    <div class="prod-info__prop-rating justify-center">
                                        <p class="prod-info__props-num">5</p>
                                        <img src="/client/assets/icon/start.svg" alt="" style="width: 14px;">
                                    </div><div class="partition"></div>
                                    <div class="prod-info__prop-cmt justify-center">
                                        <p class="prod-info__props-num">9</p>
                                        Đánh giá
                                    </div><div class="partition"></div>
                                    <div class="prod-info__prop-solded justify-center">
                                        <p class="prod-info__props-num">${product.shold}</p>
                                        Đã bán
                                    </div>
                                </div>
                            </div>
                            <div class="prod-info__cost-group">
                                <c:choose>
                                    <c:when test="${product.price == result}">
                                        <div class="prod-info__cost-complete">
                                            đ<fmt:formatNumber type="number" value="${product.price}"/>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="prod-info__cost-complete">đ<fmt:formatNumber type="number" value="${result}"/></div>
                                        <div class="prod-info__cost-org">đ<fmt:formatNumber type="number" value="${product.price}"/></div>
                                        <div class="prod-info__cost-sale-num"><p>-${product.discount}%</p></div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="prod-info__intro">
                           <div class="prod-info__data-group">
                                <span class="prod-info__data-left">Thương hiệu:</span>
                                <a class="prod-info__data-right" href="">${product.brand.name}</a>
                           </div>
                            <div class="prod-info__data-group">
                                <span class="prod-info__data-left">Xuất xứ:</span>
                                <span class="prod-info__data-right">${product.brand.origin}</span>
                           </div>
                           <div class="prod-info__data-group">
                                <span class="prod-info__data-left">Mô tả ngắn:</span>
                                <span class="prod-info__data-right">${product.shortDesc}</span>
                           </div>
                           <div class="prod-info__data-group">
                                <span class="prod-info__data-left">Cam kết:</span>
                                <span class="prod-info__data-right">Chính hãng 100%</span>
                           </div>
                           <div class="prod-info__data-group">
                                <span class="prod-info__data-left">Phân loại:</span>
                                <span class="prod-info__data-right">?</span>
                           </div>
                           <div class="prod-info__data-group">
                                <span class="prod-info__data-left">Dung tích:</span>
                                <span class="prod-info__data-right">?</span>
                           </div>
                             <div class="prod-info__data-group">
                                <span class="prod-info__data-left">Sô lượng :</span>
                                <span class="prod-info__data-right">${product.quantily}</span>
                           </div>
                        </div>
                        <div class="prod-info__btn-group d-flex">
                            <button class="btn prod-info__btn-addcart btn--outline">
                                <img src="/client/assets/icon/cart.svg" alt="" class="prod-info__icon">
                                <span class="prod-info__mobile-none">Thêm vào giỏ hàng</span>
                            </button>
                            <button class=" btn prod-info__btn-buy btn--primary">Mua ngay</button>
                        </div>
                    </section>
                </div>
            </div>
            <script>
    const price = "${product.price}";      // server render ra giá trị số
    const discount = "${product.discount}";

    const finalPrice = price * discount;

    document.getElementById("result").innerText =  finalPrice;
</script>

<p id="result"></p>

        </div>
        <!-- Product Content -->
        <div class="home__container-product ">
            <div class="prod-tab js-tabs">
                <ul class="prod-tab__list d-flex">
                    <li class="prod-tab__item prod-tab__item--current">
                        Mô tả
                    </li>
                    <li class="prod-tab__item ">
                        Đánh giá
                    </li>
                    <li class="prod-tab__item">
                        Sản phẩm tương tự
                    </li>
                </ul>
                <div class="prod-tab__contents">
                    <div class=" text-content prod-tab__content prod-tab__content--current ">
                        <div class="row">
                            <div class="col-8 col-lg-12">
                                ${product.detailDesc}
                                 <h2>Lorem ipsum dolor sit amet.</h2>
                                            <p>
                                                Lorem ipsum dolor sit amet <a href="#!">consectetur</a> adipisicing
                                                elit. Aliquid, cupiditate. Modi, quidem, ullam sint dolorum recusandae
                                                voluptates dignissimos similique animi assumenda
                                                <a href="#!">praesentium</a> et! Illum dolorem est rem voluptas nam!
                                                Voluptatem.
                                            </p>
                                            <h3>Lorem ipsum dolor sit amet.</h3>
                                            <p>
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid,
                                                cupiditate. Modi, quidem, ullam sint dolorum recusandae voluptates
                                                dignissimos similique animi assumenda praesentium et! Illum dolorem est
                                                rem voluptas nam! Voluptatem.
                                            </p>
                                            <p>
                                                <img src="/client/assets/img/image - UIHUT.png" alt="" />
                                                <em>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</em>
                                            </p>
                                            <blockquote>
                                                <p>
                                                    Lorem ipsum dolor sit amet <em>consectetur</em>
                                                    <u>adipisicing</u> elit. Aliquid, cupiditate. Modi, quidem, ullam
                                                    sint dolorum recusandae voluptates dignissimos similique animi
                                                    assumenda praesentium et! Illum dolorem est rem voluptas nam!
                                                    Voluptatem.
                                                </p>
                                            </blockquote>
                                            <h3>Lorem ipsum dolor sit amet.</h3>
                                            <p>
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid,
                                                cupiditate. Modi, quidem, ullam sint dolorum recusandae voluptates
                                                dignissimos similique animi assumenda praesentium et! Illum dolorem est
                                                rem voluptas nam! Voluptatem.
                                            </p>
                                            <p>
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid,
                                                cupiditate. Modi, quidem, ullam sint dolorum recusandae voluptates
                                                dignissimos similique animi assumenda praesentium et! Illum dolorem est
                                                rem voluptas nam! Voluptatem.
                                            </p>

                                            <hr />

                                            <h2>Lorem ipsum dolor sit amet.</h2>
                                            <p>
                                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid,
                                                cupiditate. Modi, quidem, ullam sint dolorum recusandae voluptates
                                                dignissimos similique animi assumenda praesentium et! Illum dolorem est
                                                rem voluptas nam! Voluptatem.
                                            </p>
                                            <p>
                                                <img src="/client/assets/img/image - UIHUT.png" alt="" />
                                                <em>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</em>
                                            </p>
                            </div>
                        </div>
                    </div>
                    <div class="prod-tab__content ">
                        <h3 class="prod-tab__content-heading">Những gì khách hàng của chúng tôi đang nói</h3>
                        <div class="prod-tab__cmt d-flex">
                            <div class="prod-tab__cmt-avt">
                                <img src="/client/assets/img/avt/Ellipse 61.png" alt="" class="prod-tab__cmt-avt-img">
                            </div>
                            <div class="prod-tab__cmt-info d-flex">
                                <div class="prod-tab__cmt-nameuser">
                                    <p>Jakir Hussen</p>
                                </div>
                                <div class="prod-tab__cmt-rating justify-center" style="justify-content: flex-start;">
                                    <img src="/client/assets/icon/start.svg" alt="" class="prod-tab__cmt-icon">
                                    <span class="prod-tab__cmt-number_start">5</span>
                                </div>
                                <div class="prod-tab__cmt-content">
                                    <p>Great product, I love this Coffee Beans </p>
                                </div>
                            </div>
                        </div>

                         <div class="prod-tab__cmt d-flex">
                            <div class="prod-tab__cmt-avt">
                                <img src="/client/assets/img/avt/Ellipse 61.png" alt="" class="prod-tab__cmt-avt-img">
                            </div>
                            <div class="prod-tab__cmt-info d-flex">
                                <div class="prod-tab__cmt-nameuser">
                                    <p>Jakir Hussen</p>
                                </div>
                                <div class="prod-tab__cmt-rating justify-center" style="justify-content: flex-start;">
                                    <img src="/client/assets/icon/start.svg" alt="" class="prod-tab__cmt-icon">
                                    <span class="prod-tab__cmt-number_start">5</span>
                                </div>
                                <div class="prod-tab__cmt-content">
                                    <p>Great product, I love this Coffee Beans </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="prod-tab__content ">
                        <h3 class="prod-tab__content-heading">Sản phẩm tương tự</h3>
                        <div class="home_product row row-cols-6 row-cols-lg-4 row-cols-sm-2">
                            <div class="col">
                                <article class="product-card">
                                    <div class="product-card__link">
                                        <a href="" >
                                            <img src="/client/assets/img/image - UIHUT.png" alt="" class="product-card__thumb">
                                        </a>
                                    </div>
                                    <div class="product-card__info">
                                        <h3 class="product-card__title">
                                            <a href="">Coffee Beans - Espresso Arabica and Robusta Beans</a>
                                        </h3>
                                        <p class="product-card__namebrand">
                                            Lavazza
                                        </p>
                                        <div class="product-card__row">
                                            <span class="product-card__cost">
                                                $47.00
                                            </span>
                                            <span class="product-card__rating">
                                                <img src="/client/assets/icon/start.svg" alt="" class="product-card__star">
                                                4.3
                                            </span>
                                        </div>
                                    </div>
                                </article>
                            </div>

                            <div class="col">
                            <article class="product-card">
                                <div class="product-card__link">
                                    <a href="" >
                                        <img src="/client/assets/img/image - UIHUT.png" alt="" class="product-card__thumb">
                                    </a>
                                </div>
                                <div class="product-card__info">
                                    <h3 class="product-card__title">
                                        <a href="">Coffee Beans - Espresso Arabica and Robusta Beans</a>
                                    </h3>
                                    <p class="product-card__namebrand">
                                        Lavazza
                                    </p>
                                    <div class="product-card__row">
                                        <span class="product-card__cost">
                                            $47.00
                                        </span>
                                        <span class="product-card__rating">
                                            <img src="/client/assets/icon/start.svg" alt="" class="product-card__star">
                                            4.3
                                        </span>
                                    </div>
                                </div>
                            </article>
                            </div>

                            <div class="col">
                            <article class="product-card">
                                <div class="product-card__link">
                                    <a href="" >
                                        <img src="/client/assets/img/image - UIHUT.png" alt="" class="product-card__thumb">
                                    </a>
                                </div>
                                <div class="product-card__info">
                                    <h3 class="product-card__title">
                                        <a href="">Coffee Beans - Espresso Arabica and Robusta Beans</a>
                                    </h3>
                                    <p class="product-card__namebrand">
                                        Lavazza
                                    </p>
                                    <div class="product-card__row">
                                        <span class="product-card__cost">
                                            $47.00
                                        </span>
                                        <span class="product-card__rating">
                                            <img src="/client/assets/icon/start.svg" alt="" class="product-card__star">
                                            4.3
                                        </span>
                                    </div>
                                </div>
                            </article>
                            </div>

                            <div class="col">
                                <article class="product-card">
                                    <div class="product-card__link">
                                        <a href="" >
                                            <img src="/client/assets/img/image - UIHUT.png" alt="" class="product-card__thumb">
                                        </a>
                                    </div>
                                    <div class="product-card__info">
                                        <h3 class="product-card__title">
                                            <a href="">Coffee Beans - Espresso Arabica and Robusta Beans</a>
                                        </h3>
                                        <p class="product-card__namebrand">
                                            Lavazza
                                        </p>
                                        <div class="product-card__row">
                                            <span class="product-card__cost">
                                                $47.00
                                            </span>
                                            <span class="product-card__rating">
                                                <img src="/client/assets/icon/start.svg" alt="" class="product-card__star">
                                                4.3
                                            </span>
                                        </div>
                                    </div>
                                </article>
                            </div>

                            <div class="col">
                                <article class="product-card">
                                    <div class="product-card__link">
                                        <a href="" >
                                            <img src="/client/assets/img/image - UIHUT.png" alt="" class="product-card__thumb">
                                        </a>
                                    </div>
                                    <div class="product-card__info">
                                        <h3 class="product-card__title">
                                            <a href="">Coffee Beans - Espresso Arabica and Robusta Beans</a>
                                        </h3>
                                        <p class="product-card__namebrand">
                                            Lavazza
                                        </p>
                                        <div class="product-card__row">
                                            <span class="product-card__cost">
                                                $47.00
                                            </span>
                                            <span class="product-card__rating">
                                                <img src="/client/assets/icon/start.svg" alt="" class="product-card__star">
                                                4.3
                                            </span>
                                        </div>
                                    </div>
                                </article>
                            </div>

                            <div class="col">
                            <article class="product-card">
                                <div class="product-card__link">
                                    <a href="" >
                                        <img src="/client/assets/img/image - UIHUT.png" alt="" class="product-card__thumb">
                                    </a>
                                </div>
                                <div class="product-card__info">
                                    <h3 class="product-card__title">
                                        <a href="">Coffee Beans - Espresso Arabica and Robusta Beans</a>
                                    </h3>
                                    <p class="product-card__namebrand">
                                        Lavazza
                                    </p>
                                    <div class="product-card__row">
                                        <span class="product-card__cost">
                                            $47.00
                                        </span>
                                        <span class="product-card__rating">
                                            <img src="/client/assets/icon/start.svg" alt="" class="product-card__star">
                                            4.3
                                        </span>
                                    </div>
                                </div>
                            </article>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
  

<script>
  const tabItems = document.querySelectorAll('.prod-tab__item');
  const tabContents = document.querySelectorAll('.prod-tab__content');

  tabItems.forEach((item, index) => {
    item.addEventListener('click', () => {
      // Bỏ class current khỏi tất cả
      tabItems.forEach(el => el.classList.remove('prod-tab__item--current'));
      tabContents.forEach(el => el.classList.remove('prod-tab__content--current'));

      // Thêm class current cho tab và nội dung tương ứng
      item.classList.add('prod-tab__item--current');
      tabContents[index].classList.add('prod-tab__content--current');
    });
  });
</script>

        </div>
    </div>

    
     <jsp:include page="../compoents/footerHome.jsp" />
   
</body>
</html>