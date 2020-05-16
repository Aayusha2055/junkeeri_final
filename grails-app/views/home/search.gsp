<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 4/7/20
  Time: 10:09 PM
--%>

<%@ page import="junkeeri.OptionImage; junkeeri.Options" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Search</title>
    <meta name="layout" content="main"/>
    <style>
    .category-path {
    display: none;
    }
    </style>
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<body>
<div class="search-body">
    <h1 class="display-5 color-muskmelon text-center font-weight-bold">Search Results for </h1>
    <div class="search-body-items">
        <div class="search-item-list" id="content">
            <g:render template="filterSearch"/>
        </div>
    </div>
</div>
<script>
    %{--$.ajax({--}%
    %{--    type: "GET",--}%
    %{--    url: "/home/ajaxFilterSearch/?search=${search}" + "&filter=" + filter,--}%
    %{--    success: function (data) {--}%
    %{--        var div = document.getElementById('content');--}%
    %{--        div.innerHTML = '';--}%
    %{--        div.innerHTML = data;--}%
    %{--    },--}%
    %{--    error: function (data) {--}%
    %{--        // window.location.reload();--}%
    %{--        console.log(data)--}%

    %{--    }--}%
    %{--});--}%

   $('.sub-menu ul').hide();
    $(".sub-menu a").click(function () {
	$(this).parent(".sub-menu").children("ul").slideToggle("100");
	$(this).find(".right").toggleClass("fa-angle-up fa-angle-down"); 
 }
    <%-- $('input').popup(); --%>
    
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    document.body.style.backgroundColor = "white";
}
                                                                                                                                  
</script>

  <script>
    $( function() {
        $( "#slider-range" ).slider({
            range: true,
            min: 0,
            max: 500,
            values: [ 75, 300 ],
            slide: function( event, ui ) {
                $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
            }
        });
        $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +" - $" + $( "#slider-range" ).slider( "values", 1 ) );
    });

  </script>
</body>
</html>