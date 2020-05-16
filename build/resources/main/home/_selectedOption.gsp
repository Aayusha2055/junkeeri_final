<div class="col-sm-5">
    <div class="card product-img-card">
        <div class="view overlay">
            <%def first=junkeeri.OptionImage.findByOption(option)%>
            <img class="card-img-top product-image" src="${createLink(controller: 'options', action: 'image',id: first?.id )}" alt="Card image cap" id="slide">
        </div>
    </div>
</div>
<div class="col-sm-7">
    <div class="alert alert-secondary" role="alert" style="display: none; margin-top:15px">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    </div>
    <form>
        <input type="hidden" name="quantity" value="1"/>
    <div class="card product-details">
        <div class="product-title">
            <h1 class="display-5 font-weight-bold d-flex justify-content-center">${product.name}</h1>
            <p class="font-italic d-flex justify-content-center">By&nbsp;<span
                    class="text-black-50">${product.brand}</span></p>
            <h1 class="display-5 font-weight-bold product-price d-flex justify-content-center">Rs. ${product.price}</h1>
            <hr class="hr">
        </div>
        <div class="product-desc mb-2">
            <p class="text-black-50 text-center">
                ${raw(product.description)}
            </p>
        </div>
        <div class="color-selection">
            <h5 class="d-flex justify-content-center font-weight-bold">CHOOSE YOUR COLOUR</h5>
            <ul class="list-group list-group-horizontal cursor-pointer">
                <g:each in="${options}" var="o" status="counter">
                        <label class="item">

                        <input type="radio" value="${o.id}" name="color"
                               <g:if test="${counter == 0}">checked</g:if>>
                        <% def image=junkeeri.OptionImage.findByOption(o)%>
                    <li class="list-group-item mx-2 item-small">
                        <img onclick="colorChange(this)" data-id="${o.id}" src="${createLink(controller: 'options', action: 'image',id: image?.id )}" class="d-flex w-100">
                    </li>
                        </label>

                </g:each>

            </ul>
        </div>
        <div class="feature-description d-none text-center text-black-50">
            ${raw(product.features)}
            <hr class="hr">
        </div>
        <div class="feature-instruction d-none text-center mb-2 text-black-50"">
            ${raw(product.instruction)}
            <hr class="hr">
        </div>
        <div class="size-selection">
            <h5 class="d-flex justify-content-center font-weight-bold">SIZE</h5>
            <ul class="list-group list-group-horizontal d-flex justify-content-center">
                <% def size= junkeeri.OptionSize.findAllByOption(option)%>
                <g:each in="${size}" var="s" status="counter">
                    <label class="sizes">
                    <input type="radio" value="${s.id}" name="size"
                           <g:if test="${counter == 0}">checked</g:if>>
                    <li class="list-group-item mx-2 h6 btn">
                        ${s.size}
                    </li>
                    </label>
                </g:each>

            </ul>
        </div>
        <div class="shipping-details d-none mt-5 mb-4">
            <h5 class="d-flex justify-content-center text-black-50 font-weight-bold">
                ${product.shipping}
            </h5>
        </div>

        <div class="place-order d-flex justify-content-center">
                <g:actionSubmit  class="px-5 py-3 font-weight-bold justify-content-center d-flex align-items-center h5 bg-fresh-salmon text-white border-0 btn"
                     style="border-radius: 50px;" value="Add To Bag" id="addToCart">
                    <i class="fas fa-shopping-bag mr-3"></i>
                    ADD TO BAG
                </g:actionSubmit>
        </div>
        <div class="content-selection">
            <ul class="list-group list-group-horizontal d-flex justify-content-center">
                <li class="list-group-item h5 cursor-pointer active details"
                    onclick="showDetails();">Details
                </li>
                <li class="list-group-item h5 cursor-pointer features"
                    onclick="showFeatures();">Features
                </li>
                <li class="list-group-item h5 cursor-pointer shipping"
                    onclick="showShipping();">Shipping
                </li>
                <li class="list-group-item h5 cursor-pointer instruction"
                    onclick="showInstruction();">Instructions</li>
            </ul>
        </div>
    </div>
    </form>
</div>