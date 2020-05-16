<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 4/2/20
  Time: 1:07 PM
--%>

<%@ page import="junkeeri.OptionImage" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
    <asset:javascript src="sales.js"/>
    <style>
    .category-path {
        display: none;
    }
    </style>
    <script>
        function colorChange(param) {
            console.log(param)
            var c_id = $(param).attr('data-id');
            console.log(c_id);
            url = "${createLink(controller: 'home',action: 'ajaxSelect',id:id)}";
            var fd = new FormData();
            fd.append('c_id', c_id);
            $.ajax({
                type: 'POST',
                url: url,
                data: fd,
                processData: false,
                contentType: false,
                success: function (result) {
                    var div = document.getElementById('option');
                    div.innerHTML = '';
                    div.innerHTML = result;
                    console.log(result);
                }, error: function (error) {
                    console.log(error);
                }
            });
        }

    </script>

</head>

<body>
<div class="product-body">
    <div class="row row-body" id="option">

        <g:render template="selectedOption"/>
    </div>
</div>



<script>
    // $(".color-selection ul li img").click(function () {
    //     var $src = $(this).attr('src');
    //     $('#slide').attr("src", $src);
    // });

    function showDetails() {
        $('.color-selection').removeClass("d-none");
        $('.feature-description').addClass('d-none');
        $('.details').addClass('active');
        $('.shipping-details').addClass("d-none");
        $('.shipping').removeClass('active');
        $('.size-selection').removeClass("d-none");
        $('.features').removeClass('active');
        $('.instruction').removeClass('active');
        $('.feature-instruction').addClass('d-none');
    }

    function showFeatures() {
        $('.color-selection').addClass("d-none");
        $('.feature-description').removeClass("d-none");
        $('.features').addClass('active');
        $('.details').removeClass('active');
        $('.shipping').removeClass('active');
        $('.instruction').removeClass('active');
        $('.feature-instruction').addClass('d-none');
    }

    function showShipping() {
        // $('.color-selection').removeClass("d-none");
        $('.size-selection').addClass("d-none");
        $('.shipping-details').removeClass("d-none");
        $('.details').removeClass('active');
        $('.features').removeClass('active');
        $('.shipping').addClass('active');
        $('.instruction').removeClass('active');
        $('.feature-instruction').addClass('d-none');
    }

    function showInstruction() {
        $('.color-selection').addClass("d-none");
        $('.instruction').addClass('active');
        $('.details').removeClass('active');
        $('.shipping').removeClass('active');
        $('.features').removeClass('active');
        $('.feature-instruction').removeClass('d-none');
        $('.feature-description').addClass("d-none");
        $('.size-selection').addClass("d-none");
        $('.shipping-details').addClass("d-none");

    }
</script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</body>
</html>