<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/27/20
  Time: 12:28 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Offer</title>
    <meta name="layout" content="admin"/>

</head>

<body>
<h2>Edit Offer</h2>
<form method="post">
    <g:render template="form"/>
    <input type="hidden" value="${discount?.id}" name="id">
    <g:actionSubmit value="Update" action="update" class="btn btn-primary"/>
</form>
</body>
</html>