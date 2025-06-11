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
                        <h1 class="mt-4">Thông tin thông báo</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                            <li class="breadcrumb-item active">Thông báo</li>
                            <li class="breadcrumb-item active">Thông tin thông báo</li>
                        </ol>
                    </div>
<div class="container">
        <div class="row">
          <div class="d-flex" style="padding-top: 10px;">
            <h3>notification id = ${notification_id}</h3>
          </div>
        <div class="card" style="width: 60%;">
        <ul class="list-group list-group-flush">
            <li class="list-group-item">ID: ${notification.id}</li>
            <li class="list-group-item">Tên: ${notification.name}</li>
            <div class="list-group-item text-content">Fullname: ${notification.detail_noti}</div>
            
        </ul>
        </div>
        <style>
                                            .text-content {
  font-size: 1.6rem;
  line-height: 1.6;
  color: black;
}
.text-content h1,
.text-content h2,
.text-content h3,
.text-content h4,
.text-content h5,
.text-content h6 {
  font-weight: 600;
}
.text-content h1 {
  font-size: 2.6rem;
}
.text-content h2 {
  font-size: 2.2rem;
}
.text-content h3 {
  font-size: 1.8rem;
}
.text-content h4 {
  font-size: 1.6rem;
}
.text-content h5 {
  font-size: 1.4rem;
}
.text-content h6 {
  font-size: 1.2rem;
}
.text-content h1,
.text-content h2,
.text-content h3,
.text-content h4,
.text-content h5,
.text-content h6,
.text-content p,
.text-content blockquote,
.text-content img,
.text-content figure,
.text-content ul,
.text-content ol,
.text-content table {
  margin: 20px 0;
}
.text-content img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  max-width: 90%;
}
.text-content img + em {
  display: block;
  font-style: italic;
  text-align: center;
}
.text-content a {
  color: #0071dc;
  text-decoration: underline;
}
.text-content blockquote {
  background: rgba(119, 218, 230, 0.1);
  padding: 20px;
  border-left: 3px solid #77dae6;
}
.text-content blockquote p {
  margin: 0;
}
.text-content hr {
  border: none;
  height: 1px;
  margin: 40px 0;
  background: var(--text-content-hr-bg);
}
                                        </style>
        <a href="/admin/notification" class="btn btn-primary">Back</a>
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