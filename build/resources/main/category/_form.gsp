<div class="form-group">
    <label>Name</label>
    <input type="text" name="name" class="form-control" value="${category?.name}" required>
</div>

<div class="form-group">
    <label>Category</label>
    <select name="category" class="form-control">
        <g:each in="${division}" var="d">
            <option value="${d.id}" <g:if test="${d.id==category?.division?.id}">selected</g:if>>${d?.name}</option>
        </g:each>
    </select>
</div>