<%@ page import="junkeeri.SubCategory; junkeeri.CategoryHierarchy"%>

<div class="row">
    <div class="col-sm-3 category-page-contents">
        <div class="sort-filter">
            <h3 class="font-weight-bold sort">Relevance</h3>
            <div class="dropdown select-dropdown">
                <div class="caption h4">Popular <i class="fa fa-angle-down float-right"></i> <i
                        class="fa fa-angle-up d-none"></i></div>

                <div class="list position-relative">

                    %{--                        <div class="item h4" data-value="sales-desc">Popular</div>--}%
                    <div class="item h4" data-value="id-asc" data-id="${hierarchy}" data-content="${cat}">New Arrivals</div>

                    <div class="item h4" data-value="total_sales-desc" data-id="${hierarchy}" data-content="${cat}">Best Selling</div>

                    <div class="item h4" data-value="price-asc" data-id="${hierarchy}" data-content="${cat}">Price Low to High</div>

                    <div class="item h4" data-value="price-desc" data-id="${hierarchy}" data-content="${cat}">Price High to Low</div>
                </div>
            </div>
        </div>

        <div class="sort-categories mt-5">
            <h3 class="font-weight-bold">Categories</h3>
            <ul class="list-group list-group-flush" id="category">
                <g:if test="${hierarchy==-1}">
                    <g:each in="${category}" var="${c}">
                        <li class="list-group-item h5" data-value="${c.name}" data-id="0" data-content="none">${c.name}<sup class="text-black-50">&nbsp;10</sup></li>
                    </g:each>
                </g:if>
                <g:else>
                    <% Set<junkeeri.SubCategory> catList=new HashSet<SubCategory>() %>
                    <g:each in="${products}" var="p">
                        <% def sub= junkeeri.CategoryHierarchy.findAllByProductAndHierarchy(p,hierarchy+1)
                        for (each in sub)
                        {
                            catList.add(each.category)
                        }
                    %>
                    </g:each>
                    <g:each in="${catList}" var="c">
                        <li class="list-group-item h5" data-value="${cat}" data-id="${hierarchy+1}" data-content="${c.name}">${c.name}<sup class="text-black-50">&nbsp;10</sup></li>
                    </g:each>
                </g:else>
            </ul>
        </div>
    </div>

    <div class="col-sm-9 position-relative category-relative">
        %{--            <div class="category-body-items">--}%
        %{--                <div class="category-item-list owl-carousel">--}%
        %{--                    <g:each in="${products}" var="product">--}%
        %{--                    <div class="container">--}%
        %{--                        <div class="card">--}%
        %{--                            <div class="category-img">--}%
        %{--                                <div class="content">--}%
        %{--                                    <% def option=junkeeri.Options.findByProduct(product)--}%
        %{--                                        def image=junkeeri.OptionImage.findByOption(option)--}%
        %{--                                        def offer=junkeeri.ProductsOnDiscount.findAllByProduct(product)--}%
        %{--                                    %>--}%
        %{--                                    <img src="${createLink(controller:'options', action:'image',id:image.id)}">--}%
        %{--                                </div>--}%
        %{--                            </div>--}%

        %{--                            <div class="card-img-overlay">--}%
        %{--                                <div class="sale-reference">--}%
        %{--                                    <g:if test="${offer.size()>0}">--}%
        %{--                                        <g:each in="${offer}" var="o">--}%
        %{--                                            <g:each in="${discounts}" var="d">--}%
        %{--                                                <g:if test="${o.discount==d}">--}%
        %{--                                                    <g:if test="${d.type=='Percentage'}">--}%
        %{--                                                        <div class="btn text-white bg-orange">${d.rate}% off</div>--}%
        %{--                                                    </g:if>--}%
        %{--                                                    <g:else>--}%
        %{--                                                        <div class="btn text-white bg-orange">Rs. ${d.rate } off</div>--}%
        %{--                                                    </g:else>--}%

        %{--                                                </g:if>--}%
        %{--                                            </g:each>--}%
        %{--                                        </g:each>--}%
        %{--                                    </g:if>--}%
        %{--                                </div>--}%
        %{--                            </div>--}%
        %{--                        </div>--}%

        %{--                        <div class="cat-img-desc d-flex justify-content-center">--}%
        %{--                            <div class="content">--}%
        %{--                                <div class="font-weight-bold h5">${product.name}</div>--}%

        %{--                                <div class="text-black-50 h6 font-weight-bold d-flex justify-content-center">${product.brand}</div>--}%

        %{--                                <div class="font-weight-bold color-orange h5 d-flex justify-content-center">Rs. ${product.price}</div>--}%
        %{--                            </div>--}%
        %{--                        </div>--}%
        %{--                    </div>--}%
        %{--                    </g:each>--}%
        %{--                </div>--}%
        %{--            </div>--}%
        <div class="category-body-items">
            <div class="category-item-list">
                <div class="item-filter">
               <div id="ex1" class="modal">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Cras justo odio</li>
                        <li class="list-group-item">Dapibus ac facilisis in</li>
                        <li class="list-group-item">Morbi leo risus</li>
                        <li class="list-group-item">Porta ac consectetur ac</li>
                        <li class="list-group-item">Vestibulum at eros</li>
                    </ul>
                    <%-- <a href="#" rel="modal:close">Close</a> --%>
                </div>
                <p><a href="#ex1" rel="modal:open" class="btn bg-muskmelon text-white font-weight-bold">Relevance</a></p>
                <p class="px-5 py-3 font-weight-bold d-flex align-items-center bg-fresh-salmon text-white border-0 btn rounded-pill slide-toggle" onclick="openNav()"><i class="fas fa-filter text-white">&nbsp;</i>FILTER</p>
                </div>
                <div class="row">
                    <g:each in="${products}" var="product">
                        <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 mb-3">
                            <div class="container">
                                <div class="card">
                                    <div class="category-img">
                                        <div class="content">
                                            <% def option = junkeeri.Options.findByProduct(product)
                                            def image = junkeeri.OptionImage.findByOption(option)
                                            def offer = junkeeri.ProductsOnDiscount.findAllByProduct(product)
                                            %>
                                            <img src="${createLink(controller: 'options', action: 'image', id: image.id)}" class="w-100">

                                            <div class="card-img-overlay d-flex flex-column align-items-end">
                                                <div class="sale-reference">

                                                    <g:if test="${offer.size() > 0}">
                                                        <g:each in="${offer}" var="o">
                                                            <g:each in="${discounts}" var="d">
                                                                <g:if test="${o.discount == d}">
                                                                    <g:if test="${d.type == 'Percentage'}">
                                                                        <div class="badge text-white bg-fresh-salmon">${d.rate}% off</div>
                                                                    </g:if>
                                                                    <g:else>
                                                                        <div class="badge text-white bg-fresh-salmon">Rs. ${d.rate} off</div>
                                                                    </g:else>

                                                                </g:if>
                                                            </g:each>
                                                        </g:each>
                                                    </g:if>
                                                </div>

                                                <p class="mt-auto">

                                                <div class="container-button">
                                                    <a href="/home/product/${product.name.replace(' ','-')}" class="btn btn-white btn-animated">View Product</a>
                                                </div>
                                            </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="cat-img-desc d-flex justify-content-center">
                                    <div class="content">
                                        <div class="font-weight-bold h5 d-flex justify-content-center">${product.name}</div>
                                        <div class="text-black-50 h6 font-weight-bold d-flex justify-content-center">${product.brand}</div>
                                        <div class="font-weight-bold color-orange h5 d-flex justify-content-center">Rs. ${product.price}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </div>

            </div>
        </div>

    </div>
</div>
