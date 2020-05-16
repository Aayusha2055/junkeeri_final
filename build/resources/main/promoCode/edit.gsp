<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 12/11/19
  Time: 9:45 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Promo Code</title>
    <meta name="layout" content="admin"/>
</head>

<body>
<h2 class="text-center">Edit Promo Code</h2>
<br>
<form method="post">
    <div class="form-group">
        <label>Title</label>
        <input type="text" name="title" class="form-control" value="${promoCode?.title}" required>
    </div>
    <div class="form-group">
        <label>Description</label>
        <input type="text" name="description" class="form-control" value="${promoCode?.description}" required>
    </div>
    <div class="form-group">
        <label>Type</label>
        <select  name="offerType" class="form-control" required>
            <option value="Percentage" <g:if test="${promoCode?.type=='Percentage'}">selected</g:if>>Percentage</option>
            <option value="Amount" <g:if test="${promoCode?.type=='Amount'}">selected</g:if>>Amount</option>
        </select>
    </div>

    <div class="form-group">
        <label>Rate</label>
        <input type="number" name="rate" class="form-control" value="${promoCode?.rate}" required>
    </div>

    <div class="form-group">
        <label>Valid From</label>
        <g:datePicker  name="validFrom" class="form-control"  precision="day" years="${2019..2029}" value="${promoCode?.validFrom}"/>
    </div>

    <div class="form-group">
        <label>Valid Till</label>
        <g:datePicker name="validTo" class="form-control"  precision="day" years="${2019..2030}" value="${promoCode?.validTill}"/>
    </div>

    <div class="form-group text-center">
        <g:actionSubmit action="update" controller="promoCode" id="${promoCode?.id}" value="Update" class="btn btn-primary"/>
    </div>
</form>

</body>
</html>