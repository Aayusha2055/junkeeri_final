<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 5/13/20
  Time: 1:15 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Landing Page</title>
    <meta name="layout" content="admin"/>
</head>

<body>
<div class="container-fluid">
    <h3 class="text-center">Featured</h3>
    <button class="btn btn-primary " id="addFeatured">Add Featured</button>
    <br>
    <br>
    <table class="table">
        <thead>
        <tr>
            <td>S.No.</td>
            <td>Name</td>
            <td>Title</td>
            <td>Link</td>
            <td>Image</td>
            <td>Action</td>
        </tr>
        </thead>
        <tbody>
        <g:each in="${featured}" var="f" status="count">
            <tr>
                <td>${count + 1}</td>
                <td>${f.name}</td>
                <td>${f.title}</td>
                <td>${f.link}</td>
                <td>
                    <g:img uri="${createLink(controller: 'landingPage', action: 'image', id:f.id)}" class="image"/>
                </td>
                <td>
                    <a class="btn btn-danger" onclick="return doSomething()" href="${createLink(controller: 'landingPage', action: 'deleteFeatured',id: f.id)}">Delete</a>
                    <button class="btn btn-secondary editFeatured"  data-id="${f.id}">Edit</button>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

%{--    <hr>--}%

%{--    <h3 class="text-center">Collections</h3>--}%
%{--    <table class="table">--}%
%{--        <thead>--}%
%{--        <tr>--}%
%{--        <td>--}%
%{--            S.no.--}%
%{--        </td>--}%
%{--        <td>Category</td>--}%
%{--        <td>Image</td>--}%
%{--        <td>Action</td>--}%
%{--        </tr>--}%
%{--        </thead>--}%
%{--        <tbody>--}%
%{--        <g:each in="${collection}" var="c" status="count">--}%
%{--            <tr>${count + 1}</tr>--}%
%{--            <tr>${collection.name}</tr>--}%
%{--        --}%%{--                    <tr>${collection.image}</tr>--}%
%{--            <tr><button name="Edit" class="btn btn-primary">Edit</button></tr>--}%
%{--        </g:each>--}%
%{--        <tr></tr>--}%
%{--        </tbody>--}%
%{--    </table>--}%

    <hr>

    <h3 class="text-center">Contact Details</h3>
    <a class="btn btn-primary" href="${createLink(controller: 'landingPage', action:'contactDetails')}">Edit Contact</a>
    <br>
    <br>
    <table class="table">
        <tbody>
        <tr>
            <td>Email</td>
            <td>${contact.email}</td>
        </tr>
        <tr>
            <td>Numbers</td>
            <td>${contact.numbers.replace('-', ' /   ')}</td>
        </tr>
        <tr>

            <td>Address</td>
            <td>${contact.address}</td>
        </tr>
        <tr>

            <td>Facebook Link</td>
            <td>${contact.facebook}</td>
        </tr>
        <tr>

            <td>Instagram Link</td>
            <td>${contact.instagram}</td>
        </tr>
        </tbody>
    </table>

</div>

<div class="modal fade" id="editfeaturedModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
%{--                <h4 class="modal-title">Edit Product</h4>--}%
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <form method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id">
                    <g:render template="form"/>
                    <div class="form-group">
                        <g:actionSubmit action="editFeatured" value="Edit Featured" class="btn btn-primary"/>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<div class="modal fade" id="addfeaturedModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Featured</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <form method="post" enctype="multipart/form-data">
                    <g:render template="form"/>
                    <div class="form-group">
                        <g:actionSubmit action="addFeatured" value="Add Featured" class="btn btn-primary"/>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

</body>
</html>