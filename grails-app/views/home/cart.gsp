
  <%-- Created by IntelliJ IDEA.
  User: shreya
  Date: 4/2/20
  Time: 1:03 PM --%>


<%@ page import="junkeeri.OptionImage" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Cart</title>
    <meta name="layout" content="main"/>
    <style>
    .category-path {
        display: none;
    }
    </style>
    <asset:javascript src="sales.js"/>
    <script src="https://khalti.com/static/khalti-checkout.js"></script>
</head>

<body>
<div class="cart-body">
    <div class="row">
        <div class="col-sm-8">
            <hr class="clearfix w-100 d-md-none pb-3">

            <div class="cart-title">
                <h1 class="display-5 font-weight-bold">Shopping Cart.</h1>
            </div>

            <div class="cart-contents">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" class="border-0">
                                <div class="p-2 px-md-3">Product</div>
                            </th>
                            <th scope="col" class="border-0">
                                <div class="py-2">Size</div>
                            </th>
                            <th scope="col" class="border-0">
                                <div class="py-2">Quantity</div>
                            </th>
                            <th scope="col" class="border-0">
                                <div class="py-2">Total Price</div>
                            </th>
                            <th scope="col" class="border-0">
                                <div class="py-2"></div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${currentOptionList}" var="option" status="count">

                            <tr>
                                <td scope="row">
                                    <div class="p-2">
                                        <% def image = junkeeri.OptionImage.findByOption(option) %>
                                        <img src="${createLink(controller: 'options', action: 'image', id: image.id)}"
                                             alt="" width="70" class="img-fluid rounded shadow-sm">

                                        <div class="d-inline-block align-middle w-100 text-center">
                                            <h5 class="mb-0">
                                                <a href="#"
                                                   class="text-dark font-weight-bold d-inline-block align-middle">
                                                    ${currentProductList[count].name}
                                                </a>
                                            </h5>
                                            <span
                                                    class="text-muted font-weight-normal text-black-50 d-block">${currentProductList[count].brand}</span>
                                        </div>
                                    </div>
                                </td>

                                <td class="align-middle">
                                    <strong>${currentOptionSizeList[count].size}</strong>
                                </td>

                                <td class="align-middle" style="width: 19%;">
                                    <div class="field1 rounded-pill font-weight-bold">
                                        <button type="button"
                                                class="sub btn font-weight-bold bg-transparent ml-1">-</button>
                                        <input type="text" value="${quantity[count]}" min="1"
                                               max="${currentOptionSizeList[count].stock}"
                                               class="btn font-weight-bold border-0" style="width: 50%;"/>
                                        <button type="button" class="add btn font-weight-bold bg-transparent"
                                                data-id="${currentOptionSizeList[count].stock}">+
                                        </button>
                                    </div>
                                </td>

                                <td class="align-middle">
                                    <strong>Rs.  ${currentProductList[count].price}</strong>
                                </td>
                                <td class="align-middle">
                                    <a href="#" class="text-black-50 remove-cart">
                                        <i class="fas fa-close"></i>
                                    </a>
                                </td>
                            </tr>
                        </g:each>


                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="align-middle h5 subtotal">
                                <strong>Subtotal:</strong>
                            </td>
                            <td class="align-middle subtotal-price">
                                <strong class="text-black-50 h5">${total}</strong>
                            </td>
                        </tr>
                        <tr>
                            <td class="border-0"></td>
                            <td class="border-0"></td>
                            <td class="border-0"></td>
                            <td class="align-middle h5 border-0 shipping">
                                <strong>Shipping:</strong>
                            </td>
                            <td class="align-middle border-top-0 shipping-price">
                                <strong class="text-black-50 h5 ">
                                    <g:if test="${shipping == 0}">
                                        FREE
                                    </g:if>
                                    <g:else>
                                        ${shipping}

                                    </g:else>
                                </strong>
                            </td>
                        </tr>
                        <tr>
                            <td class="border-0 continue-shopping">
                                <a href="">
                                    <div class="px-3 py-3 font-weight-bold justify-content-center align-items-center h5 bg-fresh-salmon text-white border-0 btn rounded-pill">
                                        <i class="fa fa-angle-left mr-3"></i>
                                        Continue Shopping
                                    </div>
                                </a>
                            </td>
                            <td class="border-0"></td>
                            <td class="border-0"></td>
                            <td class="align-middle h5 total">
                                <strong>Total:</strong>
                            </td>
                            <td class="align-middle total-price">
                                <strong class="text-black-50 h5 pt-0">${total}</strong>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-sm-4 cart-summary">
            <div class="row bg-white rounded shadow-sm">
                <div class="px-md-4 pt-2 payment-info">
                    <h1 class="display-6 font-weight-bold">Payment Info.</h1>
                </div>
                <hr class="clearfix w-100">
                <form class="w-100 text-center">
                <div class="px-md-4">
                    <p class="font-italic py-3">If you have a coupon code, please enter it in the box below</p>

                    <div class="input-group border rounded-pill p-2">
                        <input type="text" placeholder="Apply coupon" aria-describedby="button-addon3"
                               class="form-control border-0 promo-code-no" name="promoCode">
                        <input type="hidden" name="promoCodeValidity" value="Invalid">
                        <div class="input-group-append border-0">
                            <button id="button-addon2" type="button"
                                    class="btn bg-fresh-salmon text-white rounded-pill promo-code"><i
                                    class="fa fa-gift mr-2">
                                    </i>Apply coupon.</button>
                        </div>
                        <span class="promo-code-msg" style="color: #dd564d"></span>
                    </div>
                    <hr>
                </div>

                <div class="px-md-4 py-2 d-flex w-100 ">
                    <div class="input-group">
                        <button id="payment-button"
                                class="btn bg-khalti text-white px-4 py-2 font-weight-bold rounded-pill">Pay with Khalti.</button>
                    </div>
                </div>

              
                    <div id="ex1" class="modal">
                        <form class="m-3">
                            <p class="w-100 d-flex justify-content-center mt-3 h5">Please provide us your personal information.</p>
                            <div class="form-group">
                                <label for="InputFName" class="h4" >First Name.</label>
                                <input type="text" class="form-control" id="InputFName" placeholder="First Name">
                            </div>
                            <div class="form-group">
                                <label for="InputLName" class="h4" >Last Name.</label>
                                <input type="text" class="form-control" id="InputLName" placeholder="Last Name">
                            </div>
                            <div class="form-group">
                                <label for="InputEmail1" class="h4">Email Address.</label>
                                <input type="email" class="form-control" id="InputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="InputPNumber" class="h4">Phone Number.</label>
                                <input type="text" class="form-control" id="InputPNumber" placeholder="Phone Number">
                            </div>
                            <button type="submit" class="w-100 px-3 py-3 font-weight-bold justify-content-center align-items-center h3 bg-fresh-salmon text-white border-0 btn rounded-pill ">Submit.</button>
                        </form>
                      
                    </div>
                       <p class="w-100"><a href="#ex1" rel="modal:open" class="btn bg-muskmelon text-white px-4 py-3 w-100 font-weight-bold check-out rounded-pill">Check Out.</a></p>  
            </form>
            </div>
        </div>
    </div>
</div>

<script>
    $('.add').click(function () {
        let max = parseInt($(this).attr('data-id'));
        console.log(max);
        if ($(this).prev().val() < max) {
            $(this).prev().val(+$(this).prev().val() + 1);
        }
        let items = [];
        let value = $(this).prev().val();
        let current = getCookie('junkeeriItems');
        console.log(current)
        if (current.includes('-')) {
            var i = current.split('-');
            for (each in i) {
                if (i[each].includes(id)) {
                    startSize = i[each].lastIndexOf('&');
                    endSize = i[each].length;
                    quantity = i[each].substring(startSize, endSize);
                    new_quantity = '&times' + value;
                    i[each] = i[each].replace(quantity, new_quantity);
                    console.log('&times' + value);
                    console.log(i[each]);
                    items.push(i[each]);
                } else {
                    items.push(i[each]);
                }
            }
            var item = items.join('-');
            setCookie('junkeeriItems', item);
            console.log(getCookie('junkeeriItems'))
        } else {

            startSize = current.lastIndexOf('&');
            endSize = current.length;
            new_quantity = '&times' + value;
            quantity = current.substring(startSize, endSize);
            current = current.replace(quantity, new_quantity);
            setCookie('junkeeriItems', current)
        }
        window.location.reload();

    });
    $('.sub').click(function () {
        if ($(this).next().val() > 1) {
            if ($(this).next().val() > 1) $(this).next().val(+$(this).next().val() - 1);
        }

        let items = [];
        let value = $(this).next().val();
        let current = getCookie('junkeeriItems');
        if (current.includes('-')) {
            var i = current.split('-');
            for (each in i) {
                if (i[each].includes(id)) {
                    startSize = i[each].lastIndexOf('&');
                    endSize = i[each].length;
                    quantity = i[each].substring(startSize, endSize);
                    new_quantity = '&times' + value;
                    i[each] = i[each].replace(quantity, new_quantity);
                    console.log('&times' + value);
                    console.log(i[each]);
                    items.push(i[each]);
                } else {
                    items.push(i[each]);
                }
            }
            var item = items.join('-');
            setCookie('junkeeriItems', item);
            console.log(getCookie('junkeeriItems'))
        } else {

            startSize = current.lastIndexOf('&');
            endSize = current.length;
            new_quantity = '&times' + value;
            quantity = current.substring(startSize, endSize);
            current = current.replace(quantity, new_quantity);
            setCookie('junkeeriItems', current)
        }
        window.location.reload();
    });

    var config = {
        // replace the publicKey with yours
        "publicKey": "test_public_key_a0b77f6ac38d4f2d83cc9b848e506c6f",
        "productIdentity": "ecommerce-website",
        "productName": "junkeeri",
        "productUrl": "https://junkeeri.com",
        "eventHandler": {
            onSuccess(payload) {
                // hit merchant api for initiating verfication
                var fd = new FormData();
                fd.append('token', payload.token);
                fd.append('size',"${currentOptionSizeList.collect{it.id}.join('-')}")
                fd.append('total',${total})
                fd.append('quantity',"${quantity.collect{it}.join('-')}")
                fd.append('promoCode',$('input[name="promoCode"]').val())
                fd.append('promoCodeValidity',$('input[name="promoCodeValidity"]').val())
                $.ajax({
                    type: "POST",
                    url: '/order/payWithKhalti/',
                    data: fd,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        console.log(data);
                    },
                    error: function (data) {
                    }
                });
                console.log(payload);
            },
            onError(error) {
                console.log(error);
            },
            onClose() {
                console.log('widget is closing');
            }
        }
    };

    var checkout = new KhaltiCheckout(config);
    var btn = document.getElementById("payment-button");
    btn.onclick = function () {
        %{--checkout.show({amount: ${total*100}});--}%
        checkout.show({amount:1000});
    }

    


</script>


<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</body>
</html>