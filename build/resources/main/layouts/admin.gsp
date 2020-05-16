<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/21/20
  Time: 6:37 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Junkeeri | <g:layoutTitle></g:layoutTitle></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
%{--    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>--}%
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
          rel="stylesheet" type="text/css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="https://cdn.ckeditor.com/ckeditor5/18.0.0/classic/ckeditor.js"></script>
    <asset:stylesheet src="admin.css"/>
    <script>
    function doSomething()
    {
        return confirm('Are you sure?')
    }
</script>
</head>

<body>
<nav class="navbar navbar-expand navbar-dark bg-primary">
    <a href="#menu-toggle" id="menu-toggle" class="navbar-brand" ><span class="navbar-toggler-icon" ></span></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
    <div class="collapse navbar-collapse" id="navbarsExample02">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active"> <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> </li>
        </ul>
        <form class="form-inline my-2 my-md-0"> </form>
    </div>
</nav>
<div id="wrapper">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <li> <a href="/division/index"> Division </a> </li>
            <li> <a href="/category/index"> Categories </a> </li>
            <li> <a href="/product/index"> Product</a> </li>
            <li> <a href="/discount/index"> Discount</a> </li>
            <li> <a href="/promoCode/index"> Promo Code</a> </li>
            <li> <a href="/order/index"> Order Details</a> </li>
        </ul>
    </div> <!-- /#sidebar-wrapper -->
<!-- Page Content -->
    <div id="page-content-wrapper">
        <div class="container-fluid">
%{--            <h1>Simple Sidebar</h1>--}%
%{--            <p>This template has a responsive menu toggling system. The menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will appear/disappear. On small screens, the page content will be pushed off canvas.</p>--}%
%{--            <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>.</p>--}%
            <g:layoutBody/>
        </div>
    </div>
</div>
<div class="modal fade" id="addNewSub" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Category</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <form method="post" id="newSub">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name">
                    </div>
                    <div class="form-group">
                        <input type="submit"  value="Create" class="btn btn-primary"/>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<div class="modal fade addSize" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Size</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <form method="post" id="addSizes">
                    <div class="form-group">
                        <label>Size</label>
                        <input type="text" name="size" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Stock</label>
                        <input type="number" name="stock" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Add" class="btn btn-primary size"/>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

<script>
    $(function(){
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });

    });

    $(document).ready(function () {
        $(".table").dataTable();
    });
</script>
<asset:javascript src="custom.js"/>
%{--<script>--}%
%{--    ClassicEditor--}%
%{--        .create( document.querySelector( '.inst' ) )--}%
%{--        .then( editor => {--}%
%{--            console.log( editor );--}%
%{--        } )--}%
%{--        .catch( error => {--}%
%{--            console.error( error );--}%
%{--        } );--}%
%{--    ClassicEditor--}%
%{--        .create( document.querySelector( '.feature' ) )--}%
%{--        .then( editor => {--}%
%{--            console.log( editor );--}%
%{--        } )--}%
%{--        .catch( error => {--}%
%{--            console.error( error );--}%
%{--        } );--}%
%{--    ClassicEditor--}%
%{--        .create( document.querySelector( '.desc' ) )--}%
%{--        .then( editor => {--}%
%{--            console.log( editor );--}%
%{--        } )--}%
%{--        .catch( error => {--}%
%{--            console.error( error );--}%
%{--        } );--}%
%{--</script>--}%

</body>
</html>