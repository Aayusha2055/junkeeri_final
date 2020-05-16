<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 12/22/19
  Time: 10:44 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Change Password | Junkeeri</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <asset:link rel="stylesheet" href="login.css"/>
    <script>
    $(function () {
    $(".changePassword").validate({
        rules: {
            password: {
                required:true,
                minlength: 10
            },
            password2:{
                equalTo:"#password"
                },
            oldPassword:{
                required:true
            }
        },
        submitHandler: function (form) {
            form.submit();
        }
    });
    });
</script>
</head>

<body>
<div id="login">
    <h3 class="text-center text-white pt-5">Change Password</h3>
    <g:if test="${flash.message}">
        <br>
        <br>
        <p class=" error text-center">${flash.message}</p>
    </g:if>
    <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div id="login-box" class="col-md-12">
                    <g:form method="post" class="changePassword" id="login-form">
                        <h3 class="text-center text-info">Change Password</h3>

                        <div class="form-group">
                            <label class="text-info">Old Password:</label><br>
                            <input type="password" name="oldPassword" class="form-control" >
                        </div>

                        <div class=" form-group">
                            <label class="text-info">New Password:</label><br>
                            <input type="password" id="password" name="password" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="text-info">Re-type New Password:</label><br>
                            <input type="password" name="password2" class="form-control">
                        </div>

                        <div class="form-group text-center">
                            <g:actionSubmit value="Change password" action="newPassword" class="btn btn-info btn-md"/>
                        </div>
                        <div id="register-link" class="text-right">
                            <a href="/login/auth" class="text-info">Login</a>
                        </div>
                    </g:form>

                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>