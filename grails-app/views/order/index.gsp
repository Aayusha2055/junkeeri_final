<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 4/2/20
  Time: 10:51 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Order Details</title>
    <meta name="layout" content="admin"/>
</head>

<body>
<br>
<br>
<h2 class="text-center">Order Details</h2>
<br>
<br>
<div style="overflow-x:auto;">
    <table class="table">
        <thead>
        <tr>
            <td>SNo</td>
            <td>Name</td>
            <td>Email</td>
            <td>Number</td>
            <td>Date</td>
            <td>Payment Method</td>
            <td>Products</td>
            <td>Promo Code</td>
            <td>Total</td>
            <td>Status</td>
        </tr>
        </thead>
        <tbody>
        <g:each in="${orders}" var="order" status="counter">
            <tr>
                <td>${counter + 1}</td>
                <td>${order.customer.name}</td>
                <td>${order.customer.email}</td>
                <td>
                    <% def num = order.customer.numbers.split('-') %>
                    <g:each in="${num}" var="n">
                        ${n}<br>
                    </g:each>
                </td>
                <td>${order.customer.date}</td>
                <td>${order.customer.paymentMethod}</td>
                <td>${order.sales.optionSize.option.product.name}</td>
                <td>${order.sales.code}</td>
                <td>${order.total}</td>
                <td>
                    <g:if test="${order.status == 'Pending'}">
                        <select class="changeStatus" data-id="${order.id}">
                            <option value="Pending" selected>Pending</option>
                            <option value="Completed">Completed</option>
                        </select>
                    </g:if>
                    <g:else>
                        <span class="btn btn-default">Completed</span>
                    </g:else>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>