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
        <div class="search-filter mt-4">
        <h3 class="font-weight-bold categories-sort">Filter</h3>
        <ul class="search-filter-list">
		    <li class='sub-menu'><a href='#brand'><div class='fa fas fa-angle-down fa-x right mr-4'></div>Brand</a>
			    <ul class="sub-links">
				    <li><a href='#settings'>Lotto</a></li>
				    <li><a href='#settings'>Piazaitalia</a></li>
			    </ul>
		    </li>
            <hr class="">
		    <li class='sub-menu'><a href='#product_type'><div class='fa fas fa-angle-down fa-x right mr-4'></div>Product Type</a>
			    <ul class="sub-links">
				    <li><a href='#settings'>Hoodies</a></li>
				    <li><a href='#settings'>Jackets</a></li>
			    </ul>
		    </li>
            <hr class="">
            <li class='sub-menu'><a href='#collection'><div class='fa fas fa-angle-down fa-x right mr-4'></div>Collection</a>
			    <ul class="sub-links">
				    <li><a href='#settings'>Footwear</a></li>
				    <li><a href='#settings'>Jackets</a></li>
			    </ul>
		    </li>
            <hr class="">
	    </ul>
        </div>
        <div class="price-filter mt-4">
            <p>
            <label for="amount" class="h3 font-weight-bold">Price range</label><br>
            <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
        </p>
 
        <div id="slider-range"></div>
        </div>
    </div>
    <div class="col-sm-9 position-relative category-relative">
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
                <%-- <a href="">
                    <div class="px-5 py-3 font-weight-bold align-items-center bg-fresh-salmon text-white border-0 btn rounded-pill slide-toggle">
                            <i class="fas fa-filter text-white">&nbsp;</i>FILTER
                    </div>
                </a> --%>
                  <p class="px-5 py-3 font-weight-bold d-flex align-items-center bg-fresh-salmon text-white border-0 btn rounded-pill slide-toggle" onclick="openNav()"><i class="fas fa-filter text-white">&nbsp;</i>FILTER</p>
                </div>
    <g:each in="${products}" var="product">
        <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 mb-3">
            <div class="container">
                <div class="card">
                    <div class="category-img">
                        <div class="content">
                            <%
                                def option=junkeeri.Options.findByProduct(product)
                                def optionImage=junkeeri.OptionImage.findByOption(option)
                                def offer=junkeeri.ProductsOnDiscount.findAllByProduct(product)

                            %>

                            <img src="${createLink(controller:'options', action: 'image',id:optionImage.id)}" class="d-flex w-100">
                        </div>
                    </div>
                    <div class="card-img-overlay">
                        <div class="sale-reference">
                            <g:if test="${offer.size()>0}">
                                <g:each in="${offer}" var="o">
                                    <g:each in="${discounts}" var="d">
                                        <g:if test="${o.discount==d}">
                                            <g:if test="${d.type=='Percentage'}">

                                                <div class="badge text-white bg-orange">${d.rate}% off</div>
                                            </g:if>
                                            <g:else>

                                                <div class="badge text-white bg-orange">Rs. ${d.rate } off</div>
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
                <div class="cat-img-desc d-flex justify-content-center text-center">
                    <div class="content">
                        <div class="font-weight-bold h5">${product.name}</div>
                        <div class="text-black-50 h6 font-weight-bold d-flex justify-content-center">${product.brand}</div>
                        <div class="font-weight-bold color-orange h5 d-flex justify-content-center">${product.price}</div>
                    </div>
                </div>
            </div>
        </div>
    </g:each>
    </div>
</div>
