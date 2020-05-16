<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/23/20
  Time: 5:06 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Product</title>
    <meta name="layout" content="admin"/>
</head>

<body>
<h2>Add New Product</h2>
<br>
<g:form method="post" >
    <g:render template="form"/>
    <label>Sub Category</label>
    <a id="addSub" class="btn btn-info">Add SubCategory</a>
    <a class="btn btn-success" data-toggle="modal" data-target="#addNewSub">Add New SubCategory</a>
    <br>
    <br>
    <div class="sub-category form-group">
        <select name="subCategory" class="form-control" id="main-sub" style="width: 90%!important; display: inline-block">
            <g:each in="${subCategory}" var="s">
                <option value="${s.name}">${s.name}</option>
            </g:each>
        </select>
    </div>

    <g:actionSubmit value="Next" action="store" class="btn btn-primary"/>
</g:form>

</body>
</html>