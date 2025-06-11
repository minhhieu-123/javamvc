<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="/admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

      </head>
    <body class="sb-nav-fixed">
        <!-- header -->
        <jsp:include page="../reduce/header.jsp" />
        <!--  -->
        <div id="layoutSidenav">
            <jsp:include page="../reduce/sidebar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Product</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Product</li>
                        </ol>
                        <div class="row">
                    </div>
                            <div class="d-flex" style="justify-content: space-between; padding-top: 10px;">
                                <h3>Product</h3>
                                <a href="/admin/product/create-product"><button class="btn btn-info">Create a product</button></a>
                            </div>
                            <div class="card-body">
                                <table class="table table-hover">
                                <thead>
                                    <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Ảnh</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Giảm giá</th>
                                    <th scope="col">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="products" items="${product}">
                                        <tr>
                                            <th scope="row">${products.id}</th>
                                            <td class="d-flex" style="flex-direction: column;">
                                                <img src="/admin/assets/product/${products.image}" alt="" style="max-width: 70px; max-height: 70px; object-fit: cover;">
                                                <a href="">Sửa ảnh</a>
                                            </td>
                                            <td>${products.name}</td>
                                            <td>${products.quantily}</td>
                                            <td><fmt:formatNumber type="number" value="${products.price}"/></td>
                                            <td>${products.discount}</td>
                                            <td>
                                                <a href="/admin/product/${products.id}" class="btn btn-info" style="margin-right: 10px;">view</a>
                                                <a href="/admin/product/update-product/${products.id}" class="btn btn-warning" style="margin-right: 10px;">Edit</a>
                                                <a href="/admin/product/delete-product/${products.id}"  class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item">
                                    <a class="${1 eq currentpage ? 'disabled page-link':'page-link'}" href="/admin/product?page=${currentpage-1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                    </li>
                                    <c:forEach begin="0" end="${totalpage -1}" varStatus="loop">
                                        <li class="page-item ">
                                            <a class="${(loop.index +1) eq currentpage ? 'active page-link':'page-link'}" href="/admin/product?page=${loop.index +1}">${loop.index +1}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                    <a class="${totalpage eq currentpage ? 'disabled page-link':'page-link'}" href="/admin/product?page=${currentpage+1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                    </li>
                                </ul>
                            </nav>
                            </div>
    </div>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

                </main>
                <jsp:include page="../reduce/footer.jsp" />
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/admin/js/scripts.js"></script>


    </body>
</html>
