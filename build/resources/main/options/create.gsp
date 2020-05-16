<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/24/20
  Time: 2:39 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Options</title>
    <meta name="layout" content="admin">
</head>

<body>
<h2 class="text-center">Create options</h2>
<br>

<form method="post" enctype="multipart/form-data">
    <g:render template="form"/>
    <div class="form-group">
        <label>Sizes <span style="font-size: 12px">(If the item has no size write 'No-size')</span></label>

        <div class="sizes">
            <input type="button" class="btn btn-secondary add-size" value="Add Size">
        </div>
</div>
    <div class="form-group">
        <table border="1" cellpadding="10px">
            <thead>
            <tr>
                <td>Size</td>
                <td>Stock</td>
                <td>Action</td>
            </tr>
            </thead>
            <tbody id="sizeTable">
            </tbody>
        </table>
    </div>

    <div class="form-group">
        <g:actionSubmit value="Create" action="store" class="btn btn-primary"/>
    </div>
</form>
</body>
</html>