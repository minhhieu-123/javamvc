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
                        <h1 class="mt-4">Tao moi nguoi dung</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                            <li class="breadcrumb-item active">User</li>
                            <li class="breadcrumb-item active">Create</li>
                        </ol>
                    </div>
                     <div class="container">
        <div class="row">
            <form:form method="POST" action="/admin/user/create" modelAttribute="newUsers" enctype="multipart/form-data">
                <div class="mb-3">
                     <c:set var="ErrorEmail">
                        <form:errors path="email" cssClass="invalid-feedback" />
                    </c:set>
                    <label  class="form-label" for="">Email</label>
                    <form:input path="email" class="form-control ${not empty ErrorEmail? 'is-invalid':''}" type="text" />
                    ${ErrorEmail}
                </div>
                 <div class="mb-3">
                     <c:set var="ErrorPass">
                        <form:errors path="passworld" cssClass="invalid-feedback" />
                    </c:set>
                    <label  class="form-label" for="">Passworld</label>
                    <form:input path="passworld" class="form-control ${not empty ErrorPass? 'is-invalid':''}" type="password"/>
                     ${ErrorPass}
                </div>
                 <div class="mb-3">
                    <c:set var="ErrorName">
                        <form:errors path="fullName" cssClass="invalid-feedback" />
                    </c:set>
                    <label  class="form-label" for="">Fullname</label>
                    <form:input path="fullName" class="form-control ${not empty ErrorName? 'is-invalid':''}" type="text"/>
                      ${ErrorName}
                </div>
                 <div class="mb-3">
                    <label  class="form-label" for="">address</label>
                    <form:input path="address" class="form-control" type="text"/>
                </div>
                 <div class="mb-3">
                    <label  class="form-label" for="">phone</label>
                    <form:input path="phone" class="form-control" type="number"/>
                </div>
                  <div class="mb-3">
                    <label  class="form-label" for="">Role:</label>
                    <form:select class="form-select" path="role.name">
                        <form:option value="ADMIN">ADMIN</form:option>
                        <form:option value="USER">USER</form:option>
                    </form:select>
                </div>
                <div class="mb-3">
                    <label for="formFile" class="form-label">Avt:</label>
                    <input class="form-control" type="file" id="avatarFile" name="minhhieuFile" accept=".png, .jpg, .jpeg">
                </div>
                <div class="mb-3">
                    <img alt="avata preview" style="max-height: 250px;width: auto; display: none;" class="form-control" type="file" id="avatarPreview">
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