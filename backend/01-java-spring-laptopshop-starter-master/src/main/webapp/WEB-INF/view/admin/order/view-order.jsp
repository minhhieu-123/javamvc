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
                        <h1 class="mt-4">Thông tin đặt hàng</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                            <li class="breadcrumb-item active">Thông tin chi tiết đặt hàng</li>
                        </ol>
                    </div>
<div class="container">
        <div class="row">
          <div class="d-flex" style="padding-top: 10px;">
            <h3>Order with id = ${orders.id}</h3>
          </div>

          <table class="table table-hover">
                                <thead>
                                    <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Tên sản phẩm</th>
                                    <th scope="col">Giá cả</th>
                                    <th scope="col">Số lượng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                        <c:forEach var="orderDetail" items="${orderDetails}">
                                        <tr>
                                            <th scope="row">${orderDetail.id}</th>
                                            <td>${orderDetail.product.name}</td>
                                            <td><fmt:formatNumber type="number" value="${orderDetail.price}"/></td>
                                            <td>${orderDetail.quantity}</td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                                </table>
        <div class="card">
            <div class="row">
                <div class="col-6">
                    <ul class="list-group list-group-flush">
                    <li class="list-group-item">Tên người đặt: ${orders.user.fullName}</li>
                    <li class="list-group-item">SĐT người đặt: ${orders.user.phone}</li>
                    <li class="list-group-item">Trạng thái: ${orders.status}</li>
                    <li class="list-group-item">Vị trí: ${orders.location.address}</li>
                    <li class="list-group-item">Tên người nhận: ${orders.location.name}</li>
                    <li class="list-group-item">SĐT: ${orders.location.phone}</li>
                </ul>
                </div>
                <div class="col-6">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Ngày đặt: ${orders.date}</li>
                        <li class="list-group-item">Ngày xác nhận: ${orders.date_confirm}</li>
                        <li class="list-group-item">Ngày xác hoàn thành: ${orders.date_complete}</li>
                        <li class="list-group-item">Ngày hủy: ${orders.date_cancel}</li>

                    </ul>
                </div>

            </div>
            
        </div>
        <a href="/admin/order" class="btn btn-primary btn-small">Back</a>
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