<div class="form-group">
    <label>Name</label>
    <input type="text" name="name"  class="form-control" value="${product?.name}">
</div>
<div class="form-group">
    <label>Brand</label>
    <input type="text" name="brand"  class="form-control" value="${product?.brand}" required>
</div>

<div class="form-group">
    <label>Description</label>
    <g:textArea type="text" name="desc"  class="form-control desc" value="${product?.description}" required/>
</div>

<div class="form-group">
    <label>Instruction</label>
    <g:textArea type="text" name="instruction"  class="form-control inst" value="${product?.instruction}" required/>
</div>

<div class="form-group">
    <label>Features</label>
    <g:textArea type="text" name="features"  class="form-control feature" value="${product?.features}" required/>
</div>

<div class="form-group">
    <label>Shipping</label>
    <datalist id="myList">
        <option value="Free">Free</option>
    </datalist>
    <input type="text" list="myList" name="shipping" class="form-control" value="${product?.shipping}">
</div>
<div class="form-group">
    <label>Price</label>
    <input type="number" name="price"  class="form-control" value="${product?.price}" required>
</div>
<div class="form-group">
    <label>Division</label>
    <select name="division" class="form-control">
        <g:each in="${division}" var="d">
            <option value="${d?.id}" <g:if test="${d?.id==product?.division?.id}">selected</g:if>>${d?.name}</option>
        </g:each>
    </select>
</div>
<div class="form-group">
    <label>Category</label>
    <select name="category" class="form-control">
        <g:each in="${category}" var="c">
            <option value="${c?.id}" <g:if test="${c?.id==product?.category?.id}">selected</g:if>>${c?.name}</option>
        </g:each>
    </select>
</div>
