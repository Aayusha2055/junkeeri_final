<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/24/20
  Time: 2:40 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Options</title>
    <meta name="layout" content="admin">
</head>

<body>
<h1 class="text-center">Options</h1>
<g:link controller="options" action="create" id="${id}" class="btn btn-info add-color">Add Options</g:link>

<table class="table">
    <thead>
    <tr>
        <td>S.No.</td>
        <td>Color</td>
        <td>Images</td>
        <td>Sizes</td>
        <td>Stock</td>
        <td>Action</td>
    </tr>

    </thead>
    <tbody>


    <g:each in="${options}" var="o" status="counter">

        <tr>
            <td>${counter + 1}

            </td>
            <td>${o.color}

            </td>
            <td>
                <% def images=junkeeri.OptionImage.findAllByOption(o)%>

                <g:each in="${images}" var="image">
                    <g:img uri="${createLink(controller: 'options', action: 'image', id:image.id)}" class="image"/>
                </g:each>

            </td>
            <td>
                <%
                    def sizes=junkeeri.OptionSize.findAllByOption(o)
                    def stock=0
                %>

                <g:each in="${sizes}" var="size">
                    <%stock+=size.stock%>
                    <span class="btn btn-default">${size.size}</span>
                </g:each>
            </td>
            <td>
                ${stock}
            </td>
            <td>

                <g:link controller="options" action="edit" id="${o.id}"
                        class="btn btn-warning">Edit</g:link>


                <g:link controller="options" action="remove" id="${o.id}"
                        class="btn btn-danger" onClick="return doSomething()" >Delete</g:link>


            </td>
        </tr>


    </g:each>



    </tbody>
</table>

</body>
</html>