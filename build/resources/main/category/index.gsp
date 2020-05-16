<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/21/20
  Time: 6:50 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Categories</title>
    <meta name="layout" content="admin"/>

</head>

<body>
<br>

<h3 class="text-center">Categories</h3>
<br>
<br>
<a href="/category/create" class="btn btn-info">Add Category</a>
<br>
<br>
<table class="table">
    <thead>
    <td>SNO</td>
    <td>Name</td>
    <td>Category</td>
    <td>Action</td>
    </thead>
    <tbody>
    <tr>
        <g:each in="${category}" var="c" status="counter">
            <td>${counter+1}</td>
            <td>${c.name}</td>
            <td>${c.division.name}</td>
            <td>
                <g:link class="btn btn-primary" action="edit" id="${c.id}">Edit</g:link>
                <g:link action="remove" id="${c?.id}"
                        class="btn btn-danger" onClick="return doSomething()">Delete</g:link>
            </td>
        </g:each>
    </tr>
    </tbody>
</table>
</body>
</html>