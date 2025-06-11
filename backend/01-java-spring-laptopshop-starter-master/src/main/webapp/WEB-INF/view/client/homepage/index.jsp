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
    <!-- <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/style.css"> -->
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
</head>
<body>
    <!-- Header -->
    <!-- <header id="header" class="header header-home"></header>
    <script>
        load("#header", "./compoents/header-basic.html");
    </script> -->
    <jsp:include page="../compoents/headerHome.jsp" />
    <!--  -->
    <div class="container">
        <!-- SlideShow -->
         <section class="home__container">
             <div class="slide">
                <div class="slide__inner">
                    <div class="slide__item slide__item-current">
                        <a href="" class="slide__link">
                            <source media="(max-width: 767.98px)" srcset="/client/assets/img/item-1.png"/>
                            <img src="/client/assets/img/item-1.png" alt="" class="slide__img">
                        </a>
                    </div>
                    <div class="slide__item ">
                        <a href="" class="slide__link">
                            <source />
                            <img src="/client/assets/img/image - UIHUT.png" alt="" class="slide__img">
                        </a>
                    </div>
                    <div class="slide__item">
                        <a href="" class="slide__link">
                            <source />
                            <img src="/client/assets/img/item-1.png" alt="" class="slide__img">
                        </a>
                    </div>
                </div>
                <div class="slide__page">
                    <button class="btn-prev btn-prev-slice" onclick="prevSlide()">&#10094</button>
                    <button class="btn-next btn-next-slice" onclick="nextSlide()">&#10095</button>
                </div>
                <script>
                      const slides = document.querySelectorAll(".slide__item");
                        let slideIndex = 0;
                        let intervalId = null;

                    document.addEventListener("DOMContentLoaded", initializeSlider);

                    function initializeSlider(){
                        if(slides.length > 0){
                            slides[slideIndex].classList.add("slide__item-current");
                            intervalId = setInterval(nextSlide, 5000);
                        }
                    }

                    function showSlide(index){
                        if(index >= slides.length){
                            slideIndex = 0;
                        }
                        else if(index < 0){
                            slideIndex = slides.length - 1;
                        }

                        slides.forEach(slide => {
                            slide.classList.remove("slide__item-current");
                        });
                        slides[slideIndex].classList.add("slide__item-current");
                    }

                    function prevSlide(){
                        clearInterval(intervalId);
                        slideIndex--;
                        showSlide(slideIndex);
                    }

                    function nextSlide(){
                        slideIndex++;
                        showSlide(slideIndex);
                    }
                </script>
             </div>
         </section>
        <!--  -->
         <section class="home__container cate-position">
            <h2 class="home__heading">Danh mục</h2>
            <div class="home__cate row row-cols-3 row-cols-md-1 cate__container">
                <c:forEach var="category" items="${categorys}">
                    <div class="col">
                        <a href="/all-product?page=1&sort=no-thing&category=${category.name}" target="_blank" class="cate-item">
                            <img src="/admin/assets/category/${category.image}" alt="" class="cate-item__thumb">
                            <div class="cate-item__info">
                                <h3 class="cate-item__title">${category.name}</h3>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                <!-- Item -->
                <!--  -->
            </div>
            <button class="btn-prev btn-prev-scrolbar">&#10094</button>
            <button class="btn-next btn-next-scrolbar">&#10095</button>
            <div>

            </div>
        </section>
        <!-- Brand -->
         <section class="home__container cate-position">
            <h2 class="home__heading">Thương Hiệu</h2>
            <div class="home__cate row row-cols-3 row-cols-md-1 cate__container">
                <c:forEach var="brand" items="${brands}">
                    <div class="col">
                        <a target="_blank" href="/all-product?page=1&sort=no-thing&brand=${brand.name}" class="cate-item">
                            <img src="/admin/assets/brand/${brand.image}" alt="" class="cate-item__thumb">
                            <div class="cate-item__info">
                                <h3 class="cate-item__title">${brand.name}</h3>
                                <p class="cate-item__desc">${brand.desc_cate}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                <!-- Item -->
             
                <!-- Item -->

                <!-- Item -->
                <!--  -->
            </div>
            <button class="btn-prev btn-prev-scrolbar">&#10094</button>
            <button class="btn-next btn-next-scrolbar">&#10095</button>
            <div>

            </div>
            <script>
                const productContainer = [...document.querySelectorAll('.cate__container')];
                console.log(productContainer);
                const nxtBTNSC = [...document.querySelectorAll('.btn-next-scrolbar')];
                const preBTNSC = [...document.querySelectorAll('.btn-prev-scrolbar')];
                console.log(nxtBTNSC);
                console.log(preBTNSC);
                productContainer.forEach((item,i) =>{
                    let containerDimention=item.getBoundingClientRect();
                    let containerWith = containerDimention.width;
                    console.log(containerWith)
                    nxtBTNSC[i].addEventListener('click',()=>{
                        item.scrollLeft += containerWith;
                    })
                     preBTNSC[i].addEventListener('click',()=>{
                        item.scrollLeft -= containerWith;
                    })
                })
            </script>
        </section>
        <!--  -->
        <!-- Products -->
        <section class="home__container">
            <div class="home__row">
                <h2 class="home__heading">Sản Phẩm Mới Nhất</h2>
                <a href="/all-product" class="filter_btn">
                    Tất Cả Sản Phẩm
                    <img src="/client/assets/icon/filter.svg" alt="" class="filter_btn__icon">
                </a>
            </div>
            <!-- product-card -->
            <div class="home_product row row-cols-4 row-cols-lg-2 row-cols-sm-2">
                <c:forEach var="products" items="${product}">
                    <div class="col">
                        <article class="product-card">
                            <div class="product-card__link">
                                <a href="/product/${products.id}" >
                                    <img src="/admin/assets/product/${products.image}" alt="" class="product-card__thumb">
                                </a>
                                <c:if test="${products.discount != 0}">
                                  <div class="prod-info__cost-sale-num prod-info__sticker-sale"><p>-${products.discount}%</p></div>
                                </c:if>
                               <style>
                               </style>
                            </div>
                            <div class="product-card__info">
                                <h3 class="product-card__title">
                                    <a href="/product/${products.id}">${products.name}</a>
                                </h3>
                                <p class="product-card__namebrand">
                                    ${products.brand.name}
                                </p>
                                <div class="product-card__row">
                                    <div class="product-card__cost-group">
                                        <c:choose>
                                            <c:when test="${products.discount == 0}">
                                               <span class="product-card__cost">
                                                  đ<fmt:formatNumber type="number" value="${products.price}"/>
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="product-card__cost">
                                                    đ<fmt:formatNumber type="number" value="${products.price-(products.price * (products.discount/100))}"/>
                                                </span>
                                                <div class="prod-info__cost-org">
                                                    đ<fmt:formatNumber type="number" value="${products.price}"/>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <span class="product-card__rating">
                                        <form action="/add-product-to-cart/${products.id}" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                              <button class="btn product-card__cart">
                                                    <img src="/client/assets/icon/cart.svg" alt="">
                                                </button>
                                        </form>
                                        <style>
                                            .product-card__cart{
                                                margin-right: 20px;
                                            }
                                        </style>
                                    </span>
                                </div>
                            </div>
                        </article>
                    </div>
                </c:forEach>

             <div class="col">
                    <div class="product-card">
                        
                            <div class="product-card__link">
                                <div href="" >
                                    <img src="/client/assets/img/image - UIHUT.png" alt="" class="product-card__thumb">
                                </div>
                            </div>
                            <div class="product-card__info">
                                <h3 class="product-card__title">
                                    <a href="">Coffee Beans - Espresso Arabica and Robusta Beans Espresso Arabica and Robusta Beans</a>
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
                        
                    </div>
                </div>

            </div>
        </section>
        <!--  -->
        <!-- footer -->
    </div>
     <jsp:include page="../compoents/footerHome.jsp" />
</body>
</html>