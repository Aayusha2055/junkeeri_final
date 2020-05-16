package junkeeri

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

class ProductController {
    String path = servletContext.getRealPath("/") + "products/"

    @Secured('ROLE_ADMIN')
    def index() {
        def product=Product.list()
        [product:product]

    }

    @Secured('ROLE_ADMIN')
    def create()
    {
        def division=Division.list()
        def category=Category.list()
        def subCategory=SubCategory.list()
        [division:division,category:category,subCategory:subCategory]
    }

    @Secured('ROLE_ADMIN')
    @Transactional
    def store()
    {
        Product product=new Product()
        product.name=params.name
        product.brand=params.brand
        product.description=params.desc
        product.instruction=params.instruction
        product.features=params.features
        product.shipping=params.shipping
        product.price=params.price.toInteger()
        def division= Division.get(params.division)
        product.division=division
        product.total_sales=0
        def category=Category.get(params.category)
        product.category=category
        product.status="Available"
        product.save(failOnError:true)
        println(product.id)
        int count=1
        println(params.subCategory)
// code for category hierarchy
        for (each in params.list('subCategory'))
        {
            println(each)
            def subCat=SubCategory.findByName(each)
            println(subCat)
            CategoryHierarchy categoryHierarchy=new CategoryHierarchy()
            categoryHierarchy.product=product
            categoryHierarchy.category=subCat
            categoryHierarchy.hierarchy=count
            categoryHierarchy.save(failOnError:true)
            count+=1
        }
        redirect(action:'create', controller:'options',id:product.id)

    }

    @Secured('ROLE_ADMIN')
    def addSubCategory()
    {
        println(params)
        SubCategory subCategory=new SubCategory()
        subCategory.name=params.name
        if(subCategory.save())
        {
            response<<subCategory.name

        }
        else{
            response<<"error"
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(int id)
    {
        Product product=Product.get(id)
        def division=Division.list()
        def category=Category.list()
        def allSubCategory=SubCategory.list()
        def subCategory=CategoryHierarchy.findAllByProduct(product)
        [product: product,division: division,category: category, subCategory: subCategory,allSubCategory:allSubCategory]
    }

    @Secured('ROLE_ADMIN')
    @Transactional
    def update(int id)
    {
        Product product=Product.get(id)
        product.name=params.name
        product.brand=params.brand
        product.description=params.desc
        product.instruction=params.instruction
        product.features=params.features
        product.shipping=params.shipping
        product.price=params.price.toInteger()
        def division= Division.get(params.division)
        product.division=division
        def category=Category.get(params.category)
        product.category=category
        product.status="Available"
        product.save(failOnError:true)
        println(product.id)
        int count=1
// code for category hierarchy
        for (each in params.subCategory)
        {
            def subCat=SubCategory.findByName(each)
            CategoryHierarchy categoryHierarchy=CategoryHierarchy.findOrCreateByProductAndCategoryAndHierarchy(product,subCat,count)
//            categoryHierarchy.product=product
//            categoryHierarchy.category=subCat
//            categoryHierarchy.hierarchy=count
            categoryHierarchy.save(failOnError:true)
            count+=1
        }
        redirect(action:'index')

    }

    @Secured('ROLE_ADMIN')
    @Transactional
    def removeSubCat(int id)
    {
        println(id)
        def category=CategoryHierarchy.get(id)
        category.delete(flush: true)
    }

    @Secured('ROLE_ADMIN')
    @Transactional
    def remove(int id)
    {
        Product product=Product.get(id)
        def options=Options.findAllByProduct(product)
        for(each in options)
        {
            def sizes=OptionSize.findAllByOption(each)
            for(size in sizes)
            {
                size.delete(flush: true)
            }
            def images=OptionImage.findAllByOption(each)
            for(img in images)
            {
                def file = new File(path, img.image)
                file.delete()
                img.delete(flush: true)
            }
            each.delete(flush: true)
        }
        product.delete(flush: true, failOnError: true)
        redirect(action:'index')
    }

}
