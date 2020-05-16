<div class="form-group">
    <label>Name</label>
    <input type="text" value="${discount?.offer}" name="offer" class="form-control" required>
</div>

<div class="form-group">
    <label>Items</label>
    <br>
    <select class="md-form form-control" multiple="multiple" name="items" required>
        <g:each in="${products}" var="${product}">
            <option value="${product?.id}" <g:each in="${productOnDiscount}" var="${pod}">

                <g:if test="${pod.product?.id == product?.id}">selected</g:if></g:each>>${product?.name}</option>
        </g:each>
    </select>
</div>
<div class="form-group">
    <label>Type</label>
    <select  name="type" class="form-control" required>
        <option value="Percentage" <g:if test="${discount?.type=='Percentage'}">selected</g:if>>Percentage</option>
        <option value="Amount" <g:if test="${discount?.type=='Amount'}">selected</g:if>>Amount</option>
    </select>
</div>

%{--<div class="form-group">--}%
%{--    <label>Image</label>--}%
%{--    <input type="file" name="photo" class="form-control">--}%
%{--</div>--}%

<div class="form-group">
    <label>Rate</label>
    <input type="number" value="${discount?.rate}" name="rate" class="form-control" required>
</div>

<div class="form-group">
    <label>Valid From</label>
    <g:datePicker value="${discount?.validFrom}" name="validFrom" class="form-control"  precision="day" years="${2019..2029}"/>
</div>

<div class="form-group">
    <label>Valid Till</label>
    <g:datePicker value="${discount?.validTill}" name="validTo" class="form-control"  precision="day" years="${2019..2030}"/>
</div>