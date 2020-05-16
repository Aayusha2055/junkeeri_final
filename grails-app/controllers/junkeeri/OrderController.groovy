package junkeeri

import grails.plugin.springsecurity.annotation.Secured
import net.sf.ehcache.search.expression.Or
import org.grails.web.json.JSONObject


class OrderController {

    @Secured('ROLE_ADMIN')
    def index() {
        def orders=OrderDetails.list()
        [orders:orders]

    }

    static def offerListMain() {
        def date = new Date()
        def offers = Discount.findAllByValidFromLessThanEqualsAndValidTillGreaterThanEquals(date, date)
        return offers
    }


    @Secured('ROLE_ADMIN')
    def store()
    {
//        def sales=new Sales()
//        println(params)
////        List<Sales.Order> order=[]
//        int index=0
//        int total=DeliveryCharge.list().last().price
//        def colors=params.color.split(',')
//        def size=params.size.split(',')
//        def quantity=params.quantity.split(',')
//        for(each in colors)
//        {
//            println(each)
//            def o=new Sales.Order()
//            ObjectId id = new ObjectId(each as String)
//            def color = Color.get(id)
//            ObjectId id2 = new ObjectId(color.item)
//            def currentItem = Item.get(id2)
//            def date = new Date()
//            def offers = Offers.findAllByValidFromLessThanEqualsAndValidTillGreaterThanEquals(date, date)
//            def price=currentItem.price
//            def offer
//            for (of in offers) {
//                for (i in of.items) {
//                    if (i == currentItem) {
//                        if(of.offerType=='Rate')
//                        {
//                            price=currentItem.price-currentItem.price*of.rate/100
//
//                        }
//                        else{
//                            price=currentItem.price-of.rate
//
//                        }
//
//                    }
//                }
//            }
//            if (quantity[index].toInteger() > 1) {
//                println(price)
//                println(quantity[index])
//                price = price * quantity[index].toInteger()
//            }
//
//            total = total + price
//            o.itemName=currentItem.name
//            o.color=color.c_name
//            o.price=currentItem.price
//            if(size[index]=='undefined')
//            {
//                o.size="No-size"
//
//            }
//            o.size=size[index]
//            o.quantity=quantity[index] as Integer
//            index=index+1
//            order.add(o)
//        }
//        sales.order=order
//        if(params.promoCode) {
//            def promoCode = PromoCode.findByTitle(params.promoCode as String)
//            if (promoCode != null) {
//                Date current = new Date()
//                if (promoCode.validFrom <= current && promoCode.validTill >= current) {
//                    if (promoCode.type == "Percentage") {
//                        total = total - (total * promoCode.rate / 100)
//                    } else {
//                        if(promoCode.rate<total)
//                        {
//                            total = total - promoCode.rate
//
//                        }
//                    }
//                    sales.code=params.promoCode
//                }
//            }
//        }
//
//        if(!sales.code)
//        {
//            sales.code='None'
//        }
//        sales.total=total
//        sales.save(failOnError:true)
//        response.outputStream << sales.id

    }
    @Secured('permitAll')
    def storeOrder(String size,String quantity, String code, String codeValidity)
    {
        println(size)
        int total
        List<Sales> salesList=[]
        def sizes=[]
        int shipping=0
//        def size=optionSize.split('-')
        def quantities=quantity.split('-')
        if (size.contains('-')) {
            def sizeList = size.split('-')
            println(sizeList)
            for (each in sizeList) {
                sizes.add(each)
            }

        } else {
            sizes.add(size)
        }
        def count=0
        for (i in sizes) {
//            def eval = i.split('&')
            def optionSize = OptionSize.get(i)
            def currentOption = Options.get(optionSize.option.id)
            def currentProduct = Product.get(currentOption.product.id)
            def sales=new Sales()
            sales.product=currentProduct
            sales.optionSize=optionSize
            sales.quantity= quantities[count] as Integer
            if(codeValidity=='Valid')
            {
                sales.code=code
            }
            else{
                sales.code='none'
            }
            if(sales.save()){
                salesList.add(sales)
            }
//            currentProductList.add(currentProduct)
//            currentOptionSizeList.add(optionSize)
            if(currentProduct.shipping=='Free')
            {
                shipping+=0
            }
            else{
                shipping+=currentProduct.shipping as int
            }
            def price = currentProduct.price
            def offers = offerListMain()
            def offer
//            quantity.add(t[1])
            for (of in offers) {
                def p=ProductsOnDiscount.findAllByDiscount(of)
                for (each in p) {
                    if (each.product == currentProduct) {
                        println(currentProduct)
//                        offerList.add(of)
                        if (of.type == 'Rate') {
                            price = currentProduct.price - currentProduct.price * of.rate / 100

                        } else {
                            price = currentProduct.price - of.rate
                        }

                    }
                }
            }
            if (quantities[count].toInteger() > 1) {
                price = price * quantities[count].toInteger()
            }
            total = total + price
            count+=1
        }
        total=total+shipping
        if(codeValidity=='Valid')
        {
            def promoCode=PromoCode.findByTitle(code)
            if(promoCode.type=="Rate")
            {
                total=total-(promoCode.rate/100)
            }
            else{
                total=total-promoCode.rate

            }
        }

        return [total,salesList]
    }

    @Secured('permitAll')
    def payWithKhalti()
    {
        int total
        List<Sales> salesList
        (total, salesList)=storeOrder(params.size,params.quantity,params.promoCode,params.promoCodeValidity)
        println(total)
        println(params.token)
        def command = " curl https://khalti.com/api/v2/payment/verify/ " +
                "   -H \"Authorization:Key test_secret_key_42cf9808330d4b349cc48d37dcb66239\" " +
                "   -d amount="+"1000"+
                "   -d token=" + params.token

        ProcessBuilder processBuilder = new ProcessBuilder();
        if(!System.getProperty("os.name").contains("Windows"))
            processBuilder.command("bash", "-c", command );
        else
            processBuilder.command("cmd.exe", "/c", command );

        def cKeyResponse = "";
        try {
            Process process = processBuilder.start();
            StringBuilder output = new StringBuilder();

            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(process.getInputStream()));

            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line + "\n");
            }

            int exitVal = process.waitFor();
            if (exitVal == 0) {
                cKeyResponse = new JSONObject(output.toString())
            } else {
                return false;
            }

        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        println(cKeyResponse)
        println(cKeyResponse['state']['name'])
        if(cKeyResponse['state']['name']=='Completed')
        {
            Customer customer=new Customer()
            customer.name=cKeyResponse['user']['name']
            customer.numbers=cKeyResponse['user']['mobile']
            customer.paymentMethod='Khalti'
            customer.email='none'
            customer.date=new Date()
            customer.deliveryStatus='Pending'
            customer.total= cKeyResponse['amount'] as Integer
            customer.save()
            for(each in salesList)
            {
                OrderDetails orderDetails=new OrderDetails()
                orderDetails.customer=customer
                orderDetails.sales=each
                orderDetails.save()
            }
            response.outputStream << "done"
        }
        else{response.outputStream << "mot done"
        }
    }
}
