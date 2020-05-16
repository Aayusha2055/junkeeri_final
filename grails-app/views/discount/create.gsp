<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/27/20
  Time: 12:22 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Offer</title>
    <meta name="layout" content="admin"/>

</head>

<body>
<h2>Create Discount Offer</h2>
    <form method="post">
        <g:render template="form"/>
        <g:actionSubmit value="Create" class="btn btn-primary" action="store"/>
    </form>

</body>
</html>