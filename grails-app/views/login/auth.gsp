<html>
<head>
    <title>Login | Junkeeri</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <asset:link rel="stylesheet" href="login.css"/>
</head>

<body>


<div id="login">
    <h3 class="text-center text-white pt-5">Login form</h3>
    <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div id="login-box" class="col-md-12">
                    <form id="login-form" class="form" action="${postUrl ?: '/login/authenticate'}" method="post">
                        <h3 class="text-center text-info">Login</h3>
                        <g:if test="${flash.message}">
                            <br>
                            <br>
                            <p class=" error text-center">${flash.message}</p>
                        </g:if>
                        <div class="form-group">
                            <label for="username" class="text-info">Username:</label><br>
                            <input type="text" name="${usernameParameter ?: 'username'}" id="username" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="password" class="text-info">Password:</label><br>
                            <input type="password" name="${passwordParameter ?: 'password'}" id="password" class="form-control">
                        </div>
                        <div class="form-group">
                            <g:actionSubmit value="Login" class="btn btn-info btn-md  login_btn"/>
%{--                            <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">--}%
                        </div>
                        <div id="register-link" class="text-right">
                            <a href="/login/changePassword" class="text-info">Change Password</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>