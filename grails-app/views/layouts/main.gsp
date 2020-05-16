<!doctype html>
<html>
<head>
    <title>
        <g:layoutTitle default="JUNKEERI"/>
    </title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <asset:stylesheet src="bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface|Playfair+Display|Raleway|Roboto&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,700&display=swap" rel="stylesheet">
    <asset:stylesheet src="animate.css"/>
    <asset:stylesheet src="open-iconic-bootstrap.min.css"/>
    <asset:stylesheet src="style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    
    
    <g:layoutHead/>

</head>

<body>
<div class="header" id="navigation">

<div class="row">
    <nav class="navbar navbar-default navbar-fixed-top fixed-top bg-white">
        <div class="col-sm-3">
            <div id="mySidenav" class="sidenav position-fixed">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <span class="logo-mobile">LOGO HERE</span>
                <ul class="sideNav-menu">
		            <li class='sub-menu'><a href='#brand'>Brand<div class='fa fa-caret-down right'></div></a>
			            <ul>
				            <li><a href='#settings'>Lotto</a></li>
				            <li><a href='#settings'>Piazaitalia</a></li>
			            </ul>
		            </li>
		            <li class='sub-menu'><a href='#product_type'>Product Type<div class='fa fa-caret-down right'></div></a>
			            <ul>
				            <li><a href='#settings'>Hoodies</a></li>
				            <li><a href='#settings'>Jackets</a></li>
			            </ul>
		            </li>
                    <li class='sub-menu'><a href='#collection'>Collection<div class='fa fa-caret-down right'></div></a>
			            <ul>
				            <li><a href='#settings'>Footwear</a></li>
				            <li><a href='#settings'>Jackets</a></li>
			            </ul>
		            </li>
	            </ul>
            </div>

            <div id="main">
                <span class="bars" onclick="openNav()"><i class="fas fa-grip-lines fa-2x"></i></span>
                <span class="logo">LOGO HERE</span>
                <div class="icons-mob float-right">
                    <a href="#search"><i class="fa fa-search fa-2x pr-3"></i></a>
                    %{--<input type="search" name="search" id="search" class="d-none">--}%
%{--                    <i class="fa fa-search fa-2x pr-3"></i>--}%

                    <a href="/home/cart">
                        <i class="fas fa-shopping-bag fa-2x"></i>
                    </a>
                </div>
                <div id="search">
                    <button type="button" class="close">×</button>
                    <form class="search-form">
                        <input type="search" value="" placeholder="Search here...." />
                        <button type="submit" class="btn btn-white">Search</button>
                    </form>
                </div>

            </div>
        </div>

        <div class="col-sm-6">
            <div class="topnav-centered">
                <div class=" d-flex justify-content-center nav-item">
                    <ul class="d-inline-flex list-unstyled cursor-pointer">
                        <li class="list-group-item">
                            <a href="/home/index" class="active font-weight-bold">Home</a>
                        </li>
                        <li class="list-group-item">
                            <a href="/home/collections/Men" class="active font-weight-bold">Mens</a>
                        </li>
                        <li class="list-group-item">
                            <a href="/home/collections/Women" class="active font-weight-bold">Womens</a>
                        </li>
                        <li class="list-group-item">
                            <a href="/home/collections/Kids" class="active font-weight-bold">Kids</a>
                        </li>
                    </ul>
                </div>

                <div class="category-path">
                    <div class="d-flex justify-content-center">
%{--                        k garney?--}%
                        <span>
                        Home&nbsp;/&nbsp;${id}'s Collection&nbsp;<g:if test="${cat!='none'}">/&nbsp;${cat}</g:if>
                    </span>
                    </div>

                    <div class="card card-intro border-0">
                        <div class="card-body">
                            <div class="row d-flex justify-content-center">
                                <div class="">
                                    <h1 class="font-weight-bold">${divison}'s Collection</h1><br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-3">
            <div class="icons-lap" id="icons">
                <form class="searchbar search-form">
                        <input class="search_input searchBar" type="text" name="" placeholder="Search...">
                    <a href="#" class="search_icon"><i class="fa fa-search fa-2x"></i></a>
                </form>

                <div class="shopping-bag ml-2">
                    <a href="/home/cart" class="cart_icon">
                        <i class="fas fa-shopping-bag fa-2x shopping-bag-icon"></i>
                    </a>
                </div>

            </div>
        </div>
    </nav>
</div>
<div>
</div>

</div>

<g:layoutBody/>

%{--<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"--}%
%{--        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"--}%
%{--        crossorigin="anonymous"></script>--}%
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

%{--<script src="../vendor/main.js" type="text/javascript"></script>--}%
<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
        // document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("main").style.marginLeft = "0";
    }

    $('.sub-menu ul').hide();
    $(".sub-menu a").click(function () {
	$(this).parent(".sub-menu").children("ul").slideToggle("100");
	$(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
});
</script>
<script>
    $('.search-form').on('submit', function (e) {
        e.preventDefault();
        console.log('hiii');
        search = $(this).find('.searchBar').val();
        console.log(search);
        window.location.replace("/home/search?search=" + search);
    });
</script>
<script>
    $(function () {
        $('a[href="#search"]').on('click', function(event) {
            event.preventDefault();
            $('#search').addClass('open');
            console.log("hahah");
            $('#search > form > input[type="search"]').focus();
            console.log("hahah");
            $('.category-path').addClass('d-none');
            console.log("hahah");
        });

        $('#search, #search button.close').on('click keyup', function(event) {
            if (event.target == this || event.target.className == 'close' || event.keyCode == 27) {
                $(this).removeClass('open');
                $('.category-path').removeClass('d-none');
            }
        });

        $('form').submit(function(event) {
            event.preventDefault();
            return false;
        })
    });
</script>
</body>
</html>
