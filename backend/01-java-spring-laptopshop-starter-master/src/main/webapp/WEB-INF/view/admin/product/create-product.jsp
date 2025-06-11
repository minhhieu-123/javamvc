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
          <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                        <h1 class="mt-4">Thêm mới sản phẩm</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Sản phẩm</li>
                             <li class="breadcrumb-item active">Thêm mới sản phẩm</li>
                        </ol>
                        <div class="row">
                                <div class="card-body">
                                    <form:form method="POST" action="/admin/product/create-product" modelAttribute="newProducts" enctype="multipart/form-data">
                                        <c:set var="ErrorName">
                                            <form:errors path="name" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="ErrorPrice">
                                            <form:errors path="price" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="ErrorQuantily">
                                            <form:errors path="quantily" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="ErrorBrand">
                                            <form:errors path="brand" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="ErrorCategory">
                                            <form:errors path="category" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="ErrorDesc">
                                            <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="ErrorDescDetail">
                                            <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                        </c:set>
                                        <div class="mb-3">
                                            <label class="form-label">Tên</label>
                                            <form:input path="name" type="text" class="form-control ${not empty ErrorName? 'is-invalid':''}" placeholder="Tên"  />
                                            ${ErrorName}
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                                <label class="form-label">Giá</label>
                                                    <div class="input-group-append">
                                                        <form:input path="price" type="number" class="form-control ${not empty ErrorPrice? 'is-invalid':''}" placeholder="Giá" />
                                                        <span class="input-group-text" id="basic-addon2">VNĐ</span>
                                                        ${ErrorPrice}
                                                    </div>
                                           </div>
                                            <div class="form-group col-md-4">
                                               <label class="form-label">Giảm giá</label>
                                               <form:input path="discount" type="number" class="form-control" placeholder="Giảm giá" />
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="form-label">Số lượng</label>
                                                <form:input path="quantily" type="number" class="form-control ${not empty ErrorQuantily? 'is-invalid':''}" placeholder="Số lượng" />
                                                ${ErrorQuantily}
                                           </div>
                                        </div>
                                        <div class="form-row">
                                             <div class="form-group col-md-6">
                                                <label class="form-label">Thương hiệu</label>
                                                <form:select  class="form-select ${not empty ErrorBrand? 'is-invalid':''}" path="brand.id" >
                                                    <option  disabled selected>Vui lòng chọn thương hiệu</option>
                                                    <c:forEach items="${brand}" var="brands">
                                                        <c:choose>
                                                              <c:when test="${empty brands.name}">
                                                                <option value="${brands.id}" style="display:none;"></option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${brands.id}" label="${brands.name}"></option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </form:select>
                                                ${ErrorBrand}
                                           </div>
                                            <div class="form-group col-md-6">
                                                <label class="form-label">Danh mục</label>
                                                <form:select  class="form-select ${not empty ErrorCategory? 'is-invalid':''}" path="category.id" >
                                                    <option value="" disabled selected>Vui lòng chọn danh mục</option>
                                                    <c:forEach items="${category}" var="categorys">
                                                        <c:choose>
                                                            <c:when test="${empty categorys.name}">
                                                                <option value="${categorys.id}" style="display:none;"></option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${categorys.id}">${categorys.name}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </form:select>
                                                ${ErrorCategory}
                                           </div>
                                        </div>
                                         <div class="mb-3">
                                            <label class="form-label">Mô tả ngắn</label>
                                            <form:input path="shortDesc" type="text" class="form-control ${not empty ErrorDesc? 'is-invalid':''}" placeholder="Mô tả ngắn" />
                                            ${ErrorDesc}
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Mô tả chi tiết</label>
                                            <form:input path="detailDesc" type="text" class="form-control ${not empty ErrorDescDetail? 'is-invalid':''}" placeholder="Mô tả chi tiết"/>
                                            ${ErrorDescDetail}
                                        </div>
                                        <div class="mb-3">
                                            <label for="formFile" class="form-label">Ảnh thương hiệu</label>
                                            <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg" name="productFile" required/>
                                        </div>
                                        <div class="mb-3">
                                            <img alt="avata preview" style="max-height: 250px;width: auto; display: none;" class="form-control" type="file" id="avatarPreview">
                                        </div>
                                        <button class="btn btn-primary">submit</button>
                                    </form:form>
                                </div>
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
