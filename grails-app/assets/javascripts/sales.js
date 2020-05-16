function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function setCookie(cname, cvalue,exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue+";"+ expires +";path=/";
}
function delete_cookie (name){
    document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;'+ "path=/";
}
$(document).on('click','.remove-cart',function () {
        console.log('hii');
        let id=$(this).attr('data-id');
        let items=[];
        let current=getCookie('junkeeriItems');
        if(current.includes('-'))
        {
            var i=current.split('-');
            let here=i.indexOf(id);
            i.splice(here,1);

            var item=i  .join('-');
            setCookie('junkeeriItems',item);
        }
        else
        {
            delete_cookie('junkeeriItems');
        }
        window.location.reload();
    });


    $(document).on('click','.promo-code',function(){
       let value=$('input[name="promoCode"]').val();
       console.log(value);
       if(value==="")
        {
            console.log("hii");
        }
        else{
            console.log(value);
            $.ajax({
                url:'/home/promoCode/'+value ,
                data:$(this).serialize(),
                success: function (data) {
                    console.log(data)
                    if(data=="Promo code not valid!")
                    {
                        $('.promo-code-msg').text('Promo code not valid!');
                        $('input[name="promoCodeValidity"]').val("Invalid")
                    }
                    else if(data=="Promo code not applicable!")
                    {
                        $('.promo-code-msg').text('Promo code not applicable!');
                        $('input[name="promoCodeValidity"]').val("Invalid")

                    }
                    else{
                        $('.promo-code').remove();
                        $('#total').text(data);
                        $('.promo-code-msg').text("Promo code applied!");
                        $('input[name="promoCodeValidity"]').val("Valid")
                    }
                    console.log(data);
                },
                error: function (data) {
                    // window.location.reload();
                    console.log(data)

                }
            });

        }
    });

function addItem()
{
    let currentItem=$('input[name="size"]:checked').val();
    let quantity=$('input[name="quantity"]').val();
    currentItem=currentItem.concat('&times'+quantity);
    if(getCookie('junkeeriItems'))
    {
        let items=[];
        let current=getCookie('junkeeriItems');
        if(current.includes('-'))
        {
            var i=current.split('-');
            currentItem=currentItem.concat('&times'+quantity);
            for(each in i)
            {
                items.push(i[each])
            }
        }
        else
        {
            items.push(current)
        }

        items.push(currentItem);
        var item=items.join('-');
        setCookie('junkeeriItems',item,10);
    }
    else{
        setCookie('junkeeriItems',currentItem,10);
    }
}
console.log('hii');

$(document).on('click',"#addToCart",function (e) {
    console.log('hii');
    e.preventDefault();
    addItem();
    $('.alert-secondary').text('Item added to cart!');
    $('.alert-secondary').css('display','block');
});

$(document).on('click','#buyNow',function (e) {
    addItem();
    window.location.href='/home/cart';
});

// $(document).on('submit','.checkout',function (e) {
//     e.preventDefault();
//     $.ajax({
//         type: "POST",
//         url:'/sales/store/' ,
//         data:$(this).serialize(),
//         success: function (data) {
//             // window.location.reload();
//             $("#checkout-cart").modal('show');
//             $('input[name="sales"]').val(data);
//             console.log(data);
//         },
//         error: function (data) {
//             // window.location.reload();
//             // console.log(error(data))
//
//         }
//     });
//
// });

