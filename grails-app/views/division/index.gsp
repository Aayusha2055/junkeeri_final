<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/20/20
  Time: 4:11 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Division</title>
    <meta name="layout" content="admin"/>

</head>

<body>
<h3 class="text-center">Division</h3>
<br>
<button class="btn-outline-primary btn-info addCategory" data-toggle="modal" data-target="#addCategory">Create Division</button>
<br>
<br>
<table class="table">
    <thead>
    <td>SNO</td>
    <td>Name</td>
    <td>Image</td>
    <td>Action</td>
    </thead>
    <tbody>
    <g:each in="${division}" var="d" status="count">

        <tr>
            <td>${count+1}</td>
            <td>${d.name}</td>
            <td >
                <img src="${createLink(controller: 'division',action: 'image', id:d.id)}" style="overflow: hidden; width:20%"></td>
            <td>
                <a class="btn btn-primary editCategory" data-id="${d.id}">Edit</a>
                <g:link action="remove" id="${d?.id}"
                        class="btn btn-danger" onClick="return doSomething()">Delete</g:link>
            </td>
        </tr>
    </g:each>

    </tbody>
</table>

<div class="modal fade" id="addCategory" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Category</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <form method="post" enctype="multipart/form-data">
                    <g:render template="form"/>
                    <div class="form-group">
                        <g:actionSubmit action="store" value="Create" class="btn btn-primary"/>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<div class="modal fade" id="editCategory" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Category</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <form method="post" enctype="multipart/form-data">
                    <g:render template="form"/>
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <g:actionSubmit action="update" value="Update" class="btn btn-primary"/>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
</body>
</html>