package junkeeri

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

import java.text.SimpleDateFormat

@Secured('ROLE_ADMIN')
@Transactional
class DiscountController {
//    String path = servletContext.getRealPath("/") + "offers/"
    SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd")


    def index() {
        def discounts=Discount.listOrderByValidFrom(order:'desc')
        [discounts:discounts]
    }

    def create()
    {
        def product=Product.list()
        [products:product]
    }

//    @Secured('ROLE_ADMIN')
    def edit(String id) {
        def offer = Discount.get(id)
        def products = Product.list()
        def productOnDiscount=ProductsOnDiscount.findAllByDiscount(offer)

        [discount: offer, products:products,productOnDiscount:productOnDiscount]
    }

//    @Secured('ROLE_ADMIN')
    def store() {
        def discount= new Discount()
        def products = params.list('items')
        discount.offer=params.offer
        discount.type=params.type
        Date validFrom = sdformat.parse(params.validFrom_year + "-" + params.validFrom_month + "-" + params.validFrom_day)
        Date validTill = sdformat.parse(params.validTo_year + "-" + params.validTo_month + "-" + params.validTo_day)
        if (validFrom > validTill) {
            redirect(action: 'create')
            //msg
        }
        discount.validFrom = validFrom
        discount.validTill = validTill
        discount.rate = params.rate as Integer
        discount.save(failOnError: true)


//        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request;
//        MultipartFile photo = mpr.getFile('photo')
//        String fileName = System.currentTimeMillis() + photo.getOriginalFilename()
//        File destinationFile = new File(path, fileName)
//        photo.transferTo(destinationFile)
//        offer.image = fileName
        products.each {
            println(it)
            def pod=new ProductsOnDiscount()
            def product=Product.get(it as Integer)
            pod.product=product
            pod.discount=discount
            pod.save(failOnError:true)
        }
        redirect(action: 'index')
    }

//    @Secured('ROLE_ADMIN')
    def update() {
        def discount = Discount.get(params.id)
        def items = params.list('items')

        def initialList=ProductsOnDiscount.findAllByDiscount(discount)
        initialList.each {
            it.delete()
        }
        items.each {
            def pod=new ProductsOnDiscount()
            def product=Product.get(it as Integer)
            pod.product=product
            pod.discount=discount
            pod.save(failOnError:true)
        }
//        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request;
//        MultipartFile photo = mpr.getFile('photo')
//        if (photo.getSize()>0) {
//            File current = new File(path + offer.image)
//            current.delete()
//            String fileName = System.currentTimeMillis() + photo.getOriginalFilename()
//            File destinationFile = new File(path, fileName)
//            photo.transferTo(destinationFile)
//            offer.image = fileName

//        }
//        else{
//            offer.image=offer.image
//        }
        discount.offer = params.offer
        discount.type = params.type
        println(params.validFrom)
        Date validFrom = sdformat.parse(params.validFrom_year + "-" + params.validFrom_month + "-" + params.validFrom_day)
        Date validTill = sdformat.parse(params.validTo_year + "-" + params.validTo_month + "-" + params.validTo_day)
        println(validFrom)

        if (validFrom >validTill) {
            redirect(action: 'index')
        }
        discount.validFrom = new java.sql.Date(validFrom.getTime())
        discount.validTill = new java.sql.Date(validTill.getTime())
        discount.rate = params.rate as Integer
        discount.save(failOnError: true)
        redirect(action: 'index')

    }

//    @Secured('ROLE_ADMIN')
    def remove(String id) {
        def discount = Discount.get(id)
//        File current = new File(path + offer.image)
//        current.delete()
        def products=ProductsOnDiscount.findAllByDiscount(discount)
        products.each {
            it.delete()
        }
        discount.delete(failOnError: true)
        redirect(action: 'index')
    }

//    @Secured('permitAll')
//    def image(String id) {
//        ObjectId c_id = new ObjectId(id)
//        def offer= Offers.get(c_id)
//        File image = new File(path + offer.image)
//        response.setContentType("application/jpg")
//        OutputStream out = response.getOutputStream()
//        out.write(image.bytes)
//        out.close()
//    }
}
