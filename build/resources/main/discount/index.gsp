<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/26/20
  Time: 11:58 PM
--%>

<%@ page import="junkeeri.ProductsOnDiscount" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Discounts</title>
    <meta name="layout" content="admin"/>
</head>

<body>

<h2 class="text-center">Discounts</h2>
<br>
<br>
<a class="btn btn-info" href="/discount/create">Add Discount Offer</a>
<br>
<br>
<table class="table table-bordered">
    <thead>
    <tr>
        <td>S.No.</td>
        <td>Name</td>
        <td>Type</td>
        <td>Rate</td>
        <td>Items</td>
        <td>From</td>
        <td>Till</td>
%{--        <td>Image</td>--}%
        <td>Action</td>
    </tr>
    </thead>
    <g:each in="${discounts}" var="d" status="counter">

        <tr>
            <td>${counter + 1}</td>
            <td>${d?.offer}</td>
            <td>${d?.type}</td>
            <td>${d?.rate}</td>
            <td>
                <% def items=junkeeri.ProductsOnDiscount.findAllByDiscount(d) %>
                <g:each in="${items}" var="${item}">
                    <span class="btn btn-default">${item.product.name}</span>
                </g:each>
            </td>
            <td>${d?.validFrom}</td>
            <td>${d?.validTill}</td>
%{--            <td>--}%
%{--                <g:img uri="${createLink(controller: 'ds', action: 'image', params: [id: d?.id])}" class="image"/>--}%
%{--            </td>--}%
            <td>
                <g:link controller="discount" action="edit" id="${d?.id}"
                        class="btn btn-warning">Edit</g:link>
                <g:link controller="discount" action="remove" id="${d?.id}"
                        class="btn btn-danger" onClick="return doSomething()" >Delete</g:link>
            </td>

        </tr>
    </g:each>
</table>
</body>
</html>