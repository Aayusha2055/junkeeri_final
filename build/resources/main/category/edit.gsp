<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/21/20
  Time: 11:49 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="admin"/>
    <title>Edit Category</title>
</head>

<body>

<h3 class="text-center">Edit Category</h3>
<br>

<form method="post">
    <g:render template="form"/>
    <div class="form-group">
        <g:actionSubmit action="update" id="${id}" type="submit" class="btn btn-primary" value="Submit"/>
    </div>
</form>
</body>
</html>