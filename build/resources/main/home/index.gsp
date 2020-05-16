<%--
  Created by IntelliJ IDEA.
  User: shreya
  Date: 4/5/20
  Time: 12:45 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Junkeeri</title>
    <meta name="layout" content="main"/>

    <style>
    .category-path {
        display: none;
    }
    </style>
    <asset:stylesheet src="owl.carousel.min.css"/>
    <asset:stylesheet src="owl.theme.default.min.css"/>

</head>

<body>
<div class="index-body">
    <div class="row">
        <div id="carousel-contents" class="carousel slide carousel-fade" data-ride="carousel">
            <ol class="carousel-indicators">
                <g:each in="${featured}" var="f" status="count">
                <li data-target="#carousel-contents" data-slide-to="count" active></li>
                </g:each>
            </ol>
            <div class="carousel-inner" role="listbox">
                <g:each in="${featured}" var="f" status="count">
                <div class="carousel-item <g:if test="${count==0}">active</g:if>">
                    <div class="view">
                        <img class="d-block w-100" src="${createLink(controller: 'landingPage', action:'image', id: f.id)}" alt="First slide">
                        <div class="mask rgba-black-light"></div>
                    </div>
                    <div class="carousel-caption text-white text-uppercase">
                        <h3 class="h3-responsive title">${f.name}</h3>
                        <h1 class="h1-responsive font-weight-bold slog">${f.title}</h1>
                        <a href="${f.link}" class="btn btn-outline-white text-white font-weight-bold ">Shop Now <i
                                class="fas fa-angle-right"></i></a>
                    </div>
                </div>
                </g:each>
            </div>
            <a class="carousel-control-prev" href="#carousel-contents" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-contents" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <div class="row d-flex justify-content-center">
        <div class="jumbotron bg-white">
            <h1 class="display-6 text-uppercase font-weight-bold d-flex justify-content-center text-center">Do you love us? come
            shop with us!</h1>
            <div class="container d-flex justify-content-center text-center">
                <p class="lead">Junkeeri desires to provide costumers international products in the national market.
                Our main goal is to sell quality products and satisfy our costumer.
                We are the official franchise of Piazaitalia and Lotto in Nepal.</p>
            </div>
            <div class="btn-group d-flex justify-content-center btn-group-brand">
                <button id="button-addon3" type="button"
                        class="btn bg-muskmelon text-white px-4 py-3 w-100 font-weight-bold check-out mx-3 round-top-right">Piazaitalia</button>
                <button id="button-addon3" type="button"
                        class="btn bg-fresh-salmon text-white px-4 py-3 w-100 font-weight-bold check-out mx-3 round-bottom-left">Lotto</button>
            </div>
        </div>
    </div>
    <hr class="clearfix w-100 d-md-none pb-3">
    <div class="row index-collection">
        <h1 class="display-6 text-uppercase font-weight-bold d-flex w-100 justify-content-center title">Our collections
        </h1>
        <div class="card-deck">
            <g:each in="${divison}" var="division">
            <div class="card mb-4 gallery-pic">
                <img src="${createLink(controller:'division',action: 'image',id:division.id)}" class="img-fluid" alt="placeholder">
                <div class="card-img-overlay d-flex flex-column align-items-center">
                    <p class="mt-auto">
                    <div class="container-button">
                        <a href="/${division.name}" class="btn btn-white btn-animated">For ${division.name}</a>
                    </div>
                </p>
                </div>
            </div>
            </g:each>
        </div>
    </div>
    <hr class="clearfix w-100 d-md-none pb-3">
    <div class="row product-features">
        <div class="jumbotron bg-white">
            <h1 class="display-6 text-uppercase font-weight-bold d-flex w-100 justify-content-center title">Our services
            </h1>
            <div class="card-deck">
                <div class="card border-0">
                    <div class="text-center d-flex align-items-center rgba-black-strong py-5 px-4">
                        <div>
                            <h5 class="color-muskmelon"><i class="fas fa-cart-plus fa-3x"></i></h5>
                            <h3 class="card-title pt-2"><strong>Free Shipping</strong></h3>
                            <p class="text-black-50">Order as much as you want!</p>
                        </div>
                    </div>
                </div>
                <hr class="clearfix w-100 d-md-none pb-3">
                <div class="card border-0">
                    <div class="text-center d-flex align-items-center rgba-black-strong py-5 px-4">
                        <div>
                            <h5 class="color-muskmelon"><i class="fas fa-tshirt fa-3x"></i></h5>
                            <h3 class="card-title pt-2"><strong>30 Days Return</strong></h3>
                            <p class="text-black-50">Lorem ipsum dolor sit amet</p>

                        </div>
                    </div>
                </div>
                <hr class="clearfix w-100 d-md-none pb-3">
                <div class="card border-0">
                    <div class="text-center d-flex align-items-center rgba-black-strong py-5 px-4">
                        <div>
                            <h5 class="color-muskmelon"><i class="far fa-credit-card fa-3x"></i></h5>
                            <h3 class="card-title pt-2"><strong>Secured Payment</strong></h3>
                            <p class="text-black-50">Lorem ipsum dolor sit amet</p>

                        </div>
                    </div>
                </div>
                <hr class="clearfix w-100 d-md-none pb-3">
                <div class="card border-0">
                    <div class="text-center d-flex align-items-center rgba-black-strong py-5 px-4">
                        <div>
                            <h5 class="color-muskmelon"><i class="fas fa-user-friends fa-3x"></i></h5>
                            <h3 class="card-title pt-2"><strong>24/7 Support</strong></h3>
                            <p class="text-black-50">Lorem ipsum dolor sit amet</p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr class="clearfix w-100 d-md-none pb-3">
    <g:if test="${shoes}">
    <div class="row index-collection">
        <h1 class="display-6 text-uppercase font-weight-bold d-flex w-100 justify-content-center title">Exclusive Shoes
        </h1>
        <div class="card-deck">
            <div class="card mb-4 border-0">
                <img src="/img/shoes1.jpg" class="img-fluid d-flex w-100 index-img" alt="placeholder">
            </div>

            <div class="card mb-4 border-0">
                <img class="img-fluid d-flex w-100 index-img" src="/img/shoes2.png" alt="Card image cap">
            </div>
        </div>
        <div class="w-100 d-flex justify-content-center">
            <a href="#" class="btn btn-animated bg-muskmelon text-white">Grab these now!<i class="fas fa-angle-right"></i></i></a>
        </div>
    </div>
    </g:if>

    <hr class="clearfix w-100 d-md-none pb-3">
    <div class="row">
        <% def contactDetails=junkeeri.Contacts.first() %>
        <footer class="page-footer font-smallpt-4 w-100">
            <div class="container text-center text-md-left mb-2">
                <div class="row">
                    <div class="col-md-5 mt-md-0 mt-3">
                        <h2 class="text-uppercase font-weight-bold">Get in Touch</h2>
                        <p>Online fashion store serving at your doorstep.</p>
                        <div class="d-flex flex-row align-items-center mt-4">
                            <div class="pr-5">
                                <i class="far fa-envelope fa-2x color-muskmelon"></i>
                            </div>
                            <div class="pl-2">
                                <h6>${contactDetails.email}</h6>
                            </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mt-4">
                            <div class="pr-5">
                                <i class="fas fa-mobile-alt fa-2x color-muskmelon ml-2"></i>
                            </div>
                            <div class="pl-2">
                                <h6>${contactDetails.numbers.replace('-','  /   ')}</h6>
                            </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mt-4">
                            <div class="pr-5">
                                <i class="fas fa-map-marker-alt fa-2x color-muskmelon ml-2"></i>
                            </div>
                            <div class="pl-2">
                                <h6>${contactDetails.address}</h6>
                            </div>
                        </div>
                    </div>

                    <hr class="clearfix w-100 d-md-none pb-2">

                    <div class="col-md-3 mb-md-0">
                        <h4 class="text-uppercase font-weight-bold ">categories</h4>
                        <ul class="list-unstyled footer-list">
                            <li>
                                <a href="#!"><h5>Home</h5></a>
                            </li>
                            <li>
                                <a href="#!"><h5>Mens</h5></a>
                            </li>
                            <li>
                                <a href="#!"><h5>Womens</h5></a>
                            </li>
                            <li>
                                <a href="#!"><h5>Kids</h5></a>
                            </li>
                        </ul>
                    </div>
                    <hr class="clearfix w-100 d-md-none pb-2">
                    <div class="col-md-2 mb-md-0">
                        <h4 class="text-uppercase font-weight-bold ">Brands</h4>
                        <ul class="list-unstyled footer-list">
                            <li>
                                <a href="#!"><h5>Piazaitalia</h5></a>
                            </li>
                            <li>
                                <a href="#!"><h5>Lotto</h5></a>
                            </li>
                        </ul>
                    </div>

                    <hr class="clearfix w-100 d-md-none pb-3">
                    <div class="col-md-2 mb-md-0 mb-3">
                        <h4 class="text-uppercase font-weight-bold">Social</h4>
                        <div class="social-network d-flex">
                            <a class="social-icons facebook" href="${contactDetails.facebook}">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="social-icons instagram" href="${contactDetails.instagram}">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="clearfix w-100 d-md-none">
            <div class="footer-copyright text-center py-3 mb-3 color-muskmelon h5">© 2020 Copyright:
                <a href="https://junkeeri.com/" class="color-muskmelon">junkeeri.com</a>
            </div>
        </footer>
    </div>
</div>


<script>

    $('.carousel').carousel({
        touch: true,
        interval: 2000
    })

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<asset:script src="owl.carousel.js"/>
</body>
</html>