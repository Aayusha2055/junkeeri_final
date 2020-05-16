<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/23/20
  Time: 5:06 PM
--%>

<%@ page import="junkeeri.OptionSize; junkeeri.Options" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Product</title>
    <meta name="layout" content="admin"/>
</head>

<body>
<h2 class="text-center">Products</h2>
<br>
<br>
<a href="/product/create" class="btn btn-info">Add Product</a>
<br>
<br>
<div style="overflow-x:auto;">
<table class="table">
    <thead>
    <tr>
        <td>S.No.</td>
        <td>Product</td>
        <td>Brand</td>
        <td>Division</td>
        <td>Category</td>
        <td>Sub Category</td>
        <td>Description</td>
        <td>Features</td>
        <td>Instruction</td>
        <td>Shipping</td>
        <td>Color</td>
        <td>Status</td>
        <td>Stock</td>
        <td>Price</td>
        <td>Action</td>
    </tr>
    </thead>
    <tbody>
    <g:each in="${product}" var="p" status="counter">
        <tr>
            <td>${counter + 1}</td>
            <td>${p?.name}</td>
            <td>${p?.brand}</td>
            <td>${p?.division.name}</td>
            <td>${p?.category?.name}</td>
            <td>
                <% def categoryHierarchy=junkeeri.CategoryHierarchy.findAllByProduct(p,[sort:'hierarchy'])%>
                <g:each in="${categoryHierarchy}" var="c">
                    <g:if test="${c.product==p}">
                        ${c.category.name}
                        <br>
                    </g:if>
                </g:each>
            </td>
            <td>${p.description}</td>
            <td>${p.features}</td>
            <td>${p.instruction}</td>
            <td>${p.shipping}</td>
            <td>
                <% def stock = 0
                def options=junkeeri.Options.findAllByProduct(p)
                %>
                <g:each in="${options}" var="option">
                    <% def sizes=junkeeri.OptionSize.findAllByOption(option) %>
                    <g:each in="${sizes}" var="size">
                        <%stock=size.stock%>
                    </g:each>
                        ${option.color}
                    <br>
                </g:each>
            </td>
            <td>${p?.status}</td>
            <td>
                ${stock}
            </td>
            <td>Rs.${p?.price}</td>
            <td>
                <g:link controller="product" action="edit" id="${p?.id.toString()}"
                        class="btn btn-warning">Edit</g:link>
                <g:link controller="product" action="remove" id="${p?.id.toString()}"
                        class="btn btn-danger" onClick="return doSomething()">Delete</g:link>
                <g:link controller="options" action="index" id="${p?.id.toString()}" class="btn btn-info" >Edit Stock</g:link>
            </td>

        </tr>
    </g:each>
    </tbody>
</table>
</div>
<script>
    function colorChange(id) {
        var c_id = $(id).attr('data-id');
        url = "${createLink(controller: 'home',action: 'ajaxSelect',id:id)}";
        var fd = new FormData();
        fd.append('c_id', c_id);
        $.ajax({
            url: url, data: fd, processData: false,
            contentType: false,
            type: 'POST', success: function (result) {
                var div = document.getElementById('item');
                div.innerHTML = '';
                div.innerHTML = result;
                console.log(result);
            }, error: function (error) {
                console.log(error);
            }
        });
    }

</script>

</body>
</html>