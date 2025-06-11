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
        <!-- Products -->
         <div class="row">
            <div class="col-4">
                <section class="home__container">
                    <div class="home__row">
                            <h2 class="home__heading">Bộ lọc</h2>
                    </div>
                    <div class="row row-cols-2" id="factoryfilter">
                        <p class="col-12">Danh mục</p>
                        <c:forEach var="brand" items="${brands}">
                            <div class="col-4">
                                 <div>
                                     <input class="form-check-input" type="checkbox" name="factory" id="" value="${brand.name}">
                                     <label >${brand.name}</label>
                                 </div>
                                </div>
                        </c:forEach>
                    </div>
                     <div class="row row-cols-2" id="targetfilter">
                        <p class="col-12">Thương hiệu</p>
                        <c:forEach var="category" items="${categorys}">
                                <div class="col-4">
                                 <div>
                                     <input class="form-check-input" type="checkbox" name="targret" id="" value="${category.name}">
                                     <label >${category.name}</label>
                                 </div>
                                </div>
                        </c:forEach>
                    </div>
                    <div class="row row-cols-2" id="pricefilter">
                        <p class="col-12">Lọc theo giá tiền</p>
                        
                            <div class="col-4">
                                <input class="form-check-input" value="duoi-500k" type="checkbox" name="cost" id="">
                                <label >Dưới 500k</label>
                            </div>
                            <div class="col-4">
                                <input class="form-check-input" value="duoi-1-trieu" type="checkbox" name="cost" id="">
                                <label >Dưới 1 triệu</label>
                            </div>
                             <div class="col-4">
                                <input class="form-check-input" value="duoi-5-trieu" type="checkbox" name="cost" id="">
                                <label >Dưới 5 triệu</label>
                            </div>
                        
                    </div>
                    <div class="row row-cols-2" id="sortfilter">
                        <p class="col-12">Sắp xếp</p>
                      
                            <div class="col-4">
                                <input class="form-check-input" value="gia-tang-dan" type="radio" name="radio-sort" id="">
                                <label >Giá tăng dần</label>
                            </div>
                            <div class="col-4">
                                <input class="form-check-input" value="gia-giam-dan" type="radio" name="radio-sort" id="">
                                <label >Giá giảm dần</label>
                            </div>
                             <div class="col-4">
                                <input class="form-check-input" value="no-thing" type="radio" name="radio-sort" id="" checked>
                                <label >Mặc định</label>
                            </div>
                      
                    </div>
                    <div class="row">
                        <button id="btnFilter" class="btn btn--primary">
                            Lọc sản phẩm
                        </button>
                    </div>
                </section>
            </div>
            <div class="col-8">
                <section class="home__container">
                    <div class="home__row">
                        <h2 class="home__heading">Tất cả sản phẩm</h2>
                        <div class="filter_btn">
                        </div>
                    </div>
                    <!-- product-card -->
                    <div class="home_product row row-cols-4 row-cols-lg-2 row-cols-sm-2">
                        <c:forEach var="products" items="${product}">
                            <div class="col">
                                 <c:if test="${totalpage==0}">Khoong timf thaays sanr pham</c:if>
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
                    </div>
                    <c:if test="${totalpage>0}">
                        <nav aria-label="Page navigation">
                             <ul class="pagination justify-center">
                             <li class="page-item">
                                 <a class="${1 eq currentpage ? 'disabled page-link':'page-link'}" href="/all-product?page=${currentpage-1}" aria-label="Previous">Previous</a>
                             </li>
                             <c:forEach begin="0" end="${totalpage -1}" varStatus="loop">
                                <li class="page-item ">
                                    <a class="${(loop.index +1) eq currentpage ? 'active page-link':'page-link'}" href="/all-product?page=${loop.index +1}">${loop.index +1}</a>
                                </li>
                            </c:forEach>
                             <li class="page-item">
                                 <a class="${totalpage eq currentpage ? 'disabled page-link':'page-link'}" href="/all-product?page=${currentpage+1}" aria-label="Next">Next</a>
                             </li>
                             </ul>
                         </nav>
                    </c:if>
                </section>
            </div>
         </div>
        <!--  -->
        <!-- footer -->
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script src="/client/js/main.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>

    <jsp:include page="../compoents/footerHome.jsp" />
</body>
</html>