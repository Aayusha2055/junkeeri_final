<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 5/13/20
  Time: 1:07 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Contact Details</title>
    <meta name="layout" content="admin"/>
</head>

<body>
<br>
<div class="container">
    <h3 class="text-center">Edit Contact Details</h3>
    <g:form method="post" action="editContacts">
        <div class="form-group">
            <label>Email</label>
            <input type="text" name="email" class="form-control" value="${contact.email}">
        </div>
        <div class="form-group">
            <label>Address</label>
            <input type="text" name="address" class="form-control" value="${contact.address}">
        </div>
        <div class="form-group">
            <label>Numbers</label>
            <small>(Separate numbers with '-')</small>
            <input type="text" name="numbers" class="form-control" value="${contact.numbers}">
        </div>
        <div class="form-group">
            <label>Facebook Link</label>
            <input type="text" name="facebook" class="form-control" value="${contact.facebook}">
        </div>
        <div class="form-group">
            <label>Instagram Link</label>
            <input type="text" name="instagram" class="form-control" value="${contact.instagram}">
        </div>
        <div class="form-group  text-center">
            <input type="submit" name="Submit" class="btn btn-primary"/>
        </div>
    </g:form>
</div>
</body>
</html>