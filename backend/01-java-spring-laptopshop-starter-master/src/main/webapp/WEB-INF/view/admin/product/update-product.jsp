<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
                        <h1 class="mt-4">Cập nhật Sản phẩm</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Sản phẩm</li>
                            <li class="breadcrumb-item active">Cập nhật Sản phẩm</li>
                        </ol>
                    </div>
 <div class="container">
        <div class="row">
            <form:form method="POST" action="/admin/product/update-product" modelAttribute="newProducts">
                <div class="mb-3">
                    <label  class="form-label h2" for="">ID: ${newProducts.id}</label>
                    <form:input path="id" class="form-control" type="hidden" />
                </div>
             <div class="mb-3">
                        <label class="form-label">Tên</label>
                                            <form:input path="name" type="text" class="form-control" placeholder="Tên"/>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                                <label class="form-label">Giá</label>
                                                    <div class="input-group-append">
                                                        <form:input path="price" type="text" class="form-control" placeholder="Giá"/>
                                                        <span class="input-group-text" id="basic-addon2">VNĐ</span>
                                                    </div>
                                           </div>
                                            <div class="form-group col-md-4">
                                               <label class="form-label">Giảm giá</label>
                                               <form:input path="discount" type="text" class="form-control" placeholder="Giảm giá"/>
                                           </div>
                                            <div class="form-group col-md-4">
                                                <label class="form-label">Số lượng</label>
                                                <form:input path="quantily" type="text" class="form-control" placeholder="Số lượng"/>
                                           </div>
                                        </div>
                                        <div class="form-row">
                                             <div class="form-group col-md-6">
                                                <label class="form-label">Thương hiệu</label>
                                                <form:select name="" id="" class="form-select" path="brand.id">
                                                    <option value="" disabled >Vui lòng chọn thương hiệu</option>
                                                    <c:forEach items="${brand}" var="brands">
                                                        <c:choose>
                                                            <c:when test="brands.id==newProducts.brand.id">
                                                                <option value="${brands.id}" label="${brands.name}" selected></option>
                                                            </c:when>
                                                            <c:when test="${empty brands.name}">
                                                                <option value="${brands.id}" style="display:none;"></option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${brands.id}" label="${brands.name}"></option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </form:select>
                                           </div>
                                            <div class="form-group col-md-6">
                                                <label class="form-label">Danh mục</label>
                                                <form:select  class="form-select" path="category.id">
                                                    <option value="" disabled >Vui lòng chọn danh mục</option>
                                                    <c:forEach items="${category}" var="categorys">
                                                        <c:choose>
                                                            <c:when test="${categorys.id == newProduct.category.id}">
                                                                <option value="${categorys.id}" selected>${categorys.name}</option>
                                                            </c:when>
                                                            <c:when test="${empty categorys.name}">
                                                                <option value="${categorys.id}" style="display:none;"></option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${categorys.id}">${categorys.name}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </form:select>
                                           </div>
                                        </div>
                                         <div class="mb-3">
                                            <label class="form-label">Mô tả ngắn</label>
                                            <form:input path="shortDesc" type="text" class="form-control" placeholder="Mô tả ngắn"/>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Mô tả chi tiết</label>
                                            <form:input path="detailDesc" type="text" class="form-control" placeholder="Mô tả chi tiết"/>
                                        </div>
                <button class="btn btn-primary">submit</button>
            </form:form>
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