<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/24/20
  Time: 11:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Option</title>
    <meta name="layout" content="admin"/>

</head>

<body>
<h2 class="text-center">Edit option</h2>
<br>

<form method="post" enctype="multipart/form-data">
    <g:render template="form"/>
    <div class="form-group">
        <label>Current Files:
        </label>
        <button id="delete-multiple" class="btn btn-danger">Delete</button>
        <br>
        <div class="row">
            <g:each in="${images}" var="image">
                <div class="col-md-2 nopad text-center">
                    <label class="image-checkbox">

                        <g:img uri="${createLink(controller: 'options', action: 'image', id:image.id)}"
                               class="image"/>


                        <input type="checkbox" name="image[]" value="${image.id}"/>
                        <i class="fa fa-check hidden"></i>
                    </label>
                </div>

            </g:each>

        </div>
        <span>(Select pictures and click the delete button to delete!)</span>
    </div>

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
            <g:each in="${optionSize}" var="size">
                <tr>
                    <td>${size.size}</td>
                    <td>${size.stock}</td>
                    <td><a class="btn btn-danger remove-savedSize" onclick="return doSomething()" data-id="${size.id}">Remove</a></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="form-group">
        <g:actionSubmit value="Update" action="update" id="${option.id}" class="btn btn-primary"/>
    </div>
</form>

</body>
</html>