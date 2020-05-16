package junkeeri

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class HomeController {

    def index() {
        def category=Category.findByNameLike('shoes')
        def shoes= Product.findAllByCategory(category)
        def featured=Featured.list()
        def divison=Division.list()
        println(divison)
        [shoes:shoes,featured:featured,divison: divison]
    }

    static def offerListMain() {
        def date = new Date()
        def offers = Discount.findAllByValidFromLessThanEqualsAndValidTillGreaterThanEquals(date, date)
        return offers
    }


    def collections(String id){
        Date date=new Date()
        def divison=Division.findByName(id)
        def products=Product.findAllByDivision(divison)
        def category=Category.findAllByDivision(divison)
        def discounts=Discount.findAllByValidFromLessThanEqualsAndValidTillGreaterThanEquals(date, date)
        int hierarchy=-1
        String cat='none'
        String subcat='none'
        [category:category,products:products,divison:id,discounts:discounts,id:id, hierarchy:hierarchy,cat:cat, subcat:subcat]
    }

    @Secured('permitAll')
    def ajaxFilter(String id,String filter,String cat,int hierarchy,String subcat) {
//        def max = Math.min(params.max ?: 12, 12)
//        def offset = params.offset ?: 0
        def filterSplit = filter.split('-')
        Date date=new Date()
        def divison=Division.findByName(id)
        def category
        def products
        if(hierarchy==-1){
             category=Category.findAllByDivision(divison)
             products=Product.findAllByDivision(divison,[sort: filterSplit[0], order: filterSplit[1]])
        }
        else if(hierarchy==0){
            category=Category.findByName(cat)
            products=Product.findAllByDivisionAndCategory(divison,category,[sort: filterSplit[0], order: filterSplit[1]])
        }
        else{
            products=[]
            category=Category.findByName(cat)
            def productHierarchy=CategoryHierarchy.findAllByHierarchy(hierarchy)
            def allProducts=Product.findAllByDivisionAndCategory(divison,category,[sort: filterSplit[0], order: filterSplit[1]])
            for(each in allProducts)
            {
                for(p in productHierarchy)
                {
                    if(each==p.product)
                    {
                        products.add(each)
                    }
                }
            }
        }
        def discounts=Discount.findAllByValidFromLessThanEqualsAndValidTillGreaterThanEquals(date, date)
//        def total = item.size()
//        int upperLimit = findUpperIndex(offset, max, total as int)
//        if (item) {
//            item = item.getAt(offset..upperLimit)
//        }
//        int hierarchy=0
        render(template: "filterCategory", model: [category:category,products:products,divison:id,discounts:discounts,id:id,cat:cat,hierarchy:hierarchy,subcat: subcat])
    }

    def subCategory(String id, String cat,int hierarchy, String subcat)
    {
        println(cat)
        println(hierarchy)
        Date date=new Date()
        def divison=Division.findByName(id)
        def category
        def products
        if(hierarchy==0)
        {
            category=Category.findByName(cat)
            println(category)
            products=Product.findAllByDivisionAndCategory(divison,category)
        }
        else{
            products=[]
            category=Category.findByName(cat)
            def subCat=SubCategory.findByName(subcat)
            def productHierarchy=CategoryHierarchy.findAllByHierarchyAndCategory(hierarchy,subCat)
            def allProducts=Product.findAllByDivisionAndCategory(divison,category)
            for(each in productHierarchy)
            {
                for(p in allProducts)
                {
                    if(each.product==p)
                    {
                        products.add(p)
                    }
                }
            }
        }
        def discounts=Discount.findAllByValidFromLessThanEqualsAndValidTillGreaterThanEquals(date, date)
        println(id)
        println(cat)
        render(template: "filterCategory", model: [category:category,products:products,divison:id,discounts:discounts,id:id,hierarchy:hierarchy,cat:cat,subcat:subcat])
    }

    def cart()
    {
        List<Product> currentProductList=[]
        List<Options> currentOptionList=[]
        List<OptionSize> currentOptionSizeList=[]
        List<Discount> offerList=[]
        def quantity=[]
        def sizes=[]
        def total=0
        def shipping=0
        def size = request.getCookie('junkeeriItems')
        if (!size) {
            [message: 'No items']
        } else {
            if (size.contains('-')) {
                println(size)
                def sizeList = size.split('-')
                println(sizeList)
                for (each in sizeList) {
                    sizes.add(each)
                }

            } else {
                sizes.add(size)
            }
            for (i in sizes) {
                def eval = i.split('&')
                def optionSize = OptionSize.get(eval[0])
                if(optionSize.getClass()!=OptionSize)
                {
                    continue;
                }
                def t = eval[1].split('times')
                def currentOption = Options.get(optionSize.option.id)
                def currentProduct = Product.get(currentOption.product.id)
                currentProductList.add(currentProduct)
                currentOptionSizeList.add(optionSize)
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
                quantity.add(t[1])
                for (of in offers) {
                    def p=ProductsOnDiscount.findAllByDiscount(of)
                    for (each in p) {
                        if (each.product == currentProduct) {
                            println(currentProduct)
                            offerList.add(of)
                            if (of.type == 'Rate') {
                                price = currentProduct.price - currentProduct.price * of.rate / 100

                            } else {
                                price = currentProduct.price - of.rate
                            }

                        }
                    }
                }
                if (t[1].toInteger() > 1) {
                    price = price * t[1].toInteger()
                }

                total = total + price
                currentOptionList.add(currentOption)
            }
            total=total+shipping
            if(currentOptionList.isEmpty())
            {
                [message: 'No items']
            }
            else{
                [currentOptionList: currentOptionList,currentOptionSizeList:currentOptionSizeList, total: total,quantity:quantity, currentProductList: currentProductList, cookie: size, offerList: offerList,shipping:shipping]
            }
        }
    }

    def product(String id)
    {
        def name=id.split('-')
        Product product=Product.findByName(name.join(' '))
        def option= Options.findAllByProduct(product)
        def o = Options.get(option.first().id)
        def offers=offerListMain()
        def offer
        for (of in offers) {
            def p=ProductsOnDiscount.findAllByDiscount(of)
            for (each in p) {
                if (each.product == product) {
                    println(product)
                    offer = of
                }
            }
        }
        [product:product,options:option,option:o,offer: offer,id:id]
    }

    @Secured('permitAll')
    def ajaxSelect(String id) {
        def name=id.split('-')
        Product product=Product.findByName(name.join(' '))
        def option= Options.findAllByProduct(product)
        def o = Options.get(params.c_id)
        println(params.c_id)
        def offers = offerListMain()
        def offer
        for (of in offers) {
            def p=ProductsOnDiscount.findAllByDiscount(of)
            for (each in p) {
                if (each.product == product) {
                    println(product)
                    offer = of
                }
            }
        }
        render(template: "selectedOption", model:  [product:product,options:option,option:o,offer:offer,id:id])
    }
    def promoCode(String id) {
        def items = []
        def item = request.getCookie('junkeeriItems')
        def total = 0
        if (!item) {
            redirect(view: 'error')
        } else {
            if (item.contains('-')) {
                def itemList = item.split('-')
                for (each in itemList) {

                    items.add(each)
                }

            } else {
                items.add(item)
            }
            for (i in items) {
                def eval = i.split('&')
                def t = eval[1].split('times')
                def  size= OptionSize.get(eval[0])
                def option=Options.get(size.option.id)
                def currentProduct = Product.get(option.product.id)
                def price = currentProduct.price
                def date = new Date()
                List<Discount> offerList = []
                def offers = offerListMain()
                def offer
                for (of in offers) {
                    def p=ProductsOnDiscount.findAllByDiscount(of)
                    for (each in p) {
                        if (each.product == currentProduct) {
                            println(currentProduct)
                            offerList.add(of)
                            if (of.type == 'Rate') {
                                price = currentProduct.price - currentProduct.price * of.rate / 100

                            } else {
                                price = currentProduct.price - of.rate
                            }

                        }
                    }
                }
                if (t[1].toInteger() > 1) {
                    price = price * t[1].toInteger()
                }

                total = total + price
            }
            def promoCode = PromoCode.findByTitle(id as String)
            if (promoCode == null) {
                response << "Promo code not valid!"
            } else if (promoCode) {
                Date current = new Date()
                if (promoCode.validFrom <= current && promoCode.validTill >= current) {
                    if (promoCode.type == "Percentage") {
                        total = total - (total * promoCode.rate / 100)
                        response << total

                    } else {
                        if(promoCode.rate<total)
                        {
                            total = total - promoCode.rate
                            response << total

                        }
                        else{
                            response<<"Promo code not applicable!"
                        }
                    }
                } else {
                    response << "Promo code not valid!"
                }
            } else {
                response << "Promo code not valid!"

            }
        }
    }

    def search()
    {
        Date date=new Date()
        List<Product> productList = []
        def searchOptimized = params.search.toLowerCase().replaceAll("[^a-zA-Z0-9]", "")
        def searchOptimized1 = searchOptimized + ".*"
        def searchOptimized2 = ".*" + searchOptimized
        def searchOptimized3=".*"+searchOptimized+".*"
        def item = Product.list()
        for (each in item) {
            if (each.name.toLowerCase().replaceAll("[^a-zA-Z0-9]", "").matches(searchOptimized1)) {
                productList.add(each)
            } else if (each.brand.toLowerCase().replaceAll("[^a-zA-Z0-9]", "").matches(searchOptimized1)) {
                productList.add(each)
            }
            else if (each.name.toLowerCase().replaceAll("[^a-zA-Z0-9]", "").matches(searchOptimized2)) {
                productList.add(each)
            } else if (each.brand.toLowerCase().replaceAll("[^a-zA-Z0-9]", "").matches(searchOptimized2)) {
                productList.add(each)
            }
            else if(each.name.toLowerCase().replaceAll("[^a-zA-Z0-9]", "").matches(searchOptimized3))
            {
                productList.add(each)
            }
        }
        def total = productList.size()
//        max = Math.min(max ? max : 12, total)
//        offset = offset ? offset : 0
//        int upperLimit = findUpperIndex(offset, max, total as int)
//        if (productList) {
//            itemList = itemList.getAt(offset..upperLimit)
//        }
        def discounts=Discount.findAllByValidFromLessThanEqualsAndValidTillGreaterThanEquals(date, date)

        [products: productList, search: params.search, total: total,discounts: discounts]

    }

    def ajaxSearch(String search, String filter)
    {
        def filterSplit = filter.split('-')
        Date date=new Date()
        List<Product> productList = []
        def searchOptimized = search.toLowerCase().replaceAll("[^a-zA-Z0-9]", "")
        def searchOptimized1 = searchOptimized + ".*"
        def searchOptimized2 = ".*" + searchOptimized
        def searchOptimized3=".*"+searchOptimized+".*"
        def item = Product.list([sort: filterSplit[0], order: filterSplit[1]])
        for (each in item) {
            if (each.name.toLowerCase().replaceAll("[^a-zA-Z0-9]", "").matches(searchOptimized1)) {
                productList.add(each)
            } else if (each.brand.toLowerCase().replaceAll("[^a-zA-Z0-9]", "").matches(searchOptimized1)) {
                productList.add(each)
            }
            else if (each.name.toLowerCase().replaceAll("[^a-zA-Z0-9]", "").matches(searchOptimized2)) {
                productList.add(each)
            } else if (each.brand.toLowerCase().replaceAll("[^a-zA-Z0-9]", "").matches(searchOptimized2)) {
                productList.add(each)
            }
            else if(each.name.toLowerCase().replaceAll("[^a-zA-Z0-9]", "").matches(searchOptimized3))
            {
                productList.add(each)
            }
        }
        def total = productList.size()
//        max = Math.min(max ? max : 12, total)
//        offset = offset ? offset : 0
//        int upperLimit = findUpperIndex(offset, max, total as int)
//        if (productList) {
//            itemList = itemList.getAt(offset..upperLimit)
//        }
        def discounts=Discount.findAllByValidFromLessThanEqualsAndValidTillGreaterThanEquals(date, date)

        render(template: "filterSearch", model:[products: productList, search: params.search, total: total,discounts: discounts])
    }

}
