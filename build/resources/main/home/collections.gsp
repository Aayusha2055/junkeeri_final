<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 3/27/20
  Time: 10:23 PM
--%>

<%@ page import="junkeeri.ProductsOnDiscount; junkeeri.OptionImage; junkeeri.Options; junkeeri.CategoryHierarchy; junkeeri.SubCategory" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Category</title>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="style.css"/>
    <asset:stylesheet src="owl.carousel.min.css"/>
    <asset:stylesheet src="owl.theme.default.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    
</head>

<body>

<div class="category-body" id="content">
    <g:render template="filterCategory"/>
</div>
<script>

    $(document).on('click','#category li',function () {
        let cat = $(this).attr('data-value');
        let subcat=$(this).attr('data-content');
        let hierarchy = $(this).attr('data-id');
        $.ajax({
            type: "GET",
            url: "/home/subCategory/${id}?cat="+cat+"&hierarchy="+hierarchy+"&subcat="+subcat,
            success: function (data) {
                console.log(data);
                var div = document.getElementById('content');
                div.innerHTML = '';
                div.innerHTML = data;
            },
            error: function (data) {
                console.log(data)
            }
        });
    });


        $(document).on('click','.dropdown > .caption',function () {
            $(this).parent().toggleClass('open');
            <%-- $(this).parent().slideToggle("100"); --%>
        });

        $(document).on('click','.dropdown > .list > .item',function () {
            $('.dropdown > .list > .item').removeClass('selected');
            $(this).addClass('selected').parent().parent().removeClass('open').children('.caption').text($(this).text());
            let filter = $(this).attr('data-value');
            let cat = $(this).attr('data-content');
            let hierarchy = $(this).attr('data-id');
            $.ajax({
                type: "GET",
                url: "/home/ajaxFilter/${id}?filter=" + filter + "&cat="+cat + "&hierarchy=" + hierarchy+"&subcat="+${subcat},
                success: function (data) {
                    console.log(data);
                    var div = document.getElementById('content');
                    div.innerHTML = '';
                    div.innerHTML = data;

                },
                error: function (data) {
                    // window.location.reload();
                    console.log(data)

                }
            });
        });

        $(document).on('keyup', function (evt) {
            if ((evt.keyCode || evt.which) === 27) {
                $('.dropdown').removeClass('open');
            }
        });

        $(document).click(function (evt) {
            if ($(evt.target).closest(".dropdown > .caption").length === 0) {
                $('.dropdown').removeClass('open');
            }
        });

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
    // $(document).ready(function () {
    //     $('.category-item-list').owlCarousel({
    //         center: true,
    //         loop: true,
    //
    //         responsiveClass: true,
    //         responsive: {
    //             0: {
    //                 items: 2,
    //                 nav: true
    //             },
    //             600: {
    //                 items: 3,
    //                 nav: false
    //             },
    //             1000: {
    //                 items: 5,
    //                 margin: 50,
    //                 nav: true,
    //                 autoplay: true
    //
    //             }
    //         }
    //     })

    // });
</script>

<asset:javascript src="owl.carousel.js"/>
<asset:javascript src="owl.carousel.min.js"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

</body>
</html>