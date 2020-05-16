<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/24/20
  Time: 11:32 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Product</title>
    <meta name="layout" content="admin"/>
</head>

<body>
<form method="post">
    <g:render template="form"/>
    <div class="form-group">
        <label>Sub Category</label>
        <a id="addSub" class="btn btn-info">Add SubCategory</a>
        <a class="btn btn-success" data-toggle="modal" data-target="#addNewSub">Add New SubCategory</a>
        <br>
        <br>

        <div class="sub-category form-group">

            <g:each in="${subCategory}" var="${sub}">
                <select name="subCategory" class="form-control" id="main-sub"
                        style="width: 90%!important; display: inline-block">
                    <g:each in="${allSubCategory}" var="s">
                        <option value="${s.name}" <g:if test="${sub?.category?.id==s.id}">selected</g:if>>${s.name}</option>
                    </g:each>
                </select>
                &nbsp;
                <a class="btn btn-danger removeSub" data-id="${sub?.id}">Remove</a>
            </g:each>

        </div>

    </div>

    <div class="form-group">
        <g:actionSubmit value="Submit" action="update" id="${product?.id}" class="btn btn-primary" />
    </div>
</form>
<script>
    $('.removeSub').on('click',function () {
        let data=$(this).attr('data-id');
        console.log(data);
        $.ajax({
            type: "GET",
            url:"/product/removeSubCat/"+data,
            success: function (data) {
                // window.location.reload();
                if(data=="error")
                {
                    alert("Sorry error occurred");
                }
                $(this).prev().remove();
                $(this).remove();
                console.log(data)
            },
            error: function (data) {
                // window.location.reload();
                console.log(data);
                $(this).prev().remove();
                $(this).remove();
            }
        });


    });
</script>
</body>
</html>