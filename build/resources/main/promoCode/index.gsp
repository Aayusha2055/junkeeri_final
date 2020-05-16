<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 12/10/19
  Time: 10:34 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Promo Codes</title>
    <meta name="layout" content="admin"/>
</head>

<body>
<br>
<h2 class="text-center">Promo Codes</h2>
<br>
<button class="btn btn-info create-promo">Create Promo Code</button>
<br>
<br>
<table class="table table-bordered">
    <thead>
    <tr>
        <td>S.No.</td>
        <td>Code</td>
        <td>Title</td>
        <td>Type</td>
        <td>Rate</td>
        <td>Valid From</td>
        <td>Valid Till</td>
        <td>Action</td>
    </tr>
    </thead>
    <g:each in="${promoCode}" var="code" status="counter">

        <tr>
            <td>${counter + 1}</td>
            <td>${code?.title}</td>
            <td>${code?.description}</td>
            <td>${code?.type}</td>
            <td>${code?.rate}</td>
            <td>${code?.validFrom}</td>
            <td>${code?.validTill}</td>
            <td>
                <g:link controller="promoCode" action="edit" id="${code?.id}"
                        class="btn btn-warning">Edit</g:link>
                <g:link controller="promoCode" action="remove" id="${code?.id}"
                        class="btn btn-danger" onClick="return doSomething()" >Delete</g:link>
            </td>

        </tr>
    </g:each>
</table>


<div class="modal fade" id="promoModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Create Promo Code</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <form method="post">
                    <div class="form-group">
                        <label>Title</label>
                        <input type="text" name="title" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <input type="text" name="description" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Type</label>
                        <select  name="offerType" class="form-control">
                            <option value="Percentage">Percentage</option>
                            <option value="Amount">Amount</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Rate</label>
                        <input type="number" name="rate" class="form-control" required >
                    </div>

                    <div class="form-group">
                        <label>Valid From</label>
                        <g:datePicker  name="validFrom" class="form-control"  precision="day" years="${2019..2029}" />
                    </div>

                    <div class="form-group">
                        <label>Valid Till</label>
                        <g:datePicker name="validTo" class="form-control"  precision="day" years="${2019..2030}"/>
                    </div>

                    <div class="form-group">
                        <g:actionSubmit action="store" controller="promoCode" value="Create Promo Code" class="btn btn-primary"/>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

</body>
</html>