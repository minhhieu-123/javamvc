<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <h1 class="mt-4">Quản lý order</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                      <div class="card-body">
                                <table class="table table-hover">
                                <thead>
                                    <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">User</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Thời gian tạo</th>
                                    <th scope="col">Tùy chọn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                        <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <th scope="row">${order.id}</th>
                                            <td><fmt:formatNumber type="number" value="${order.totalPrice}"/></td>
                                            <td>${order.user.email}</td>
                                            <td>${order.status}</td>
                                            <td>${order.date}</td>
                                            <td>
                                                <a href="/admin/order/${order.id}" class="btn btn-info" style="margin-right: 10px;">View</a>
                                                <a href="/admin/order/update-order/${order.id}" class="btn btn-warning" style="margin-right: 10px;">Edit</a>
                                                <a href="/admin/order/delete-order/${order.id}"  class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                                </table>
                            </div>
                    </div>
                </main>
                <jsp:include page="../reduce/footer.jsp" />
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/admin/js/scripts.js"></script>
    </body>
</html>
