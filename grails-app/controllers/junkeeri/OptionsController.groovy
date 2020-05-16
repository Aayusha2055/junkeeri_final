package junkeeri

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

class OptionsController {
    String path = servletContext.getRealPath("/") + "products/"

    @Secured('ROLE_ADMIN')
    def index(int id) {
        def product = Product.get(id)
        def options = Options.findAllByProduct(product)
        [id: id, options: options]
    }

    @Secured('ROLE_ADMIN')
    def create(int id) {
        println(id)
        Product product = Product.get(id)
        [product: product]
    }

    @Secured('ROLE_ADMIN')
    def store() {
        Product product = Product.get(params.product)
        println(product)
        Options option = new Options()
        option.color = params.color
        option.sales = 0
        option.product = product
        option.save(failOnError: true)
        def sizes = params.list('sizes')
        def stock = params.list('stocks')
        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request;
        List<MultipartFile> files = mpr.getFiles('images')
        def count = 1
        files.each {
            String fileName = System.currentTimeMillis() + it.getOriginalFilename()
            File destinationFile = new File(path, fileName)
            it.transferTo(destinationFile)
            OptionImage image = new OptionImage()
            image.image = fileName
            image.option = option
            image.hierarchy = count
            image.save(failOnError: true)
            count += 1
        }

        def count2 = 0
        sizes.each {
            println(stock[count2])
            OptionSize size = new OptionSize()
            size.size = it
            size.stock = stock[count2] as Integer
            size.option = option
            size.save(failOnError: true)
        }
        redirect(action: 'index', id:option.product.id)
    }

    @Secured('permitAll')
    def image(int id) {
        OptionImage img = OptionImage.get(id)
        File image = new File(path + img.image)
        response.setContentType("application/jpg")
        OutputStream out = response.getOutputStream()
        out.write(image.bytes)
        out.close()
    }

    @Secured('ROLE_ADMIN')
    def edit(int id) {
        def option = Options.get(id)
        def product = Product.get(option.product.id)
        def optionSize = OptionSize.findAllByOption(option)
        def images = OptionImage.findAllByOption(option)
        [option: option, product: product, optionSize: optionSize, images: images]
    }

    @Transactional
    def update(int id)
    {
        Product product = Product.get(params.product)
        println(product)
        Options option = Options.get(id)
        option.color = params.color
        println(params.color)
        option.product = product
        option.save(failOnError: true)
        if(params.list('sizes'))
        {
            def sizes = params.list('sizes')
            def stock = params.list('stocks')
            def count2 = 0
            sizes.each {
                println(stock[count2])
                OptionSize size = new OptionSize()
                size.size = it
                size.stock = stock[count2] as Integer
                size.option = option
                size.save(failOnError: true)
            }
        }

        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request;
        List<MultipartFile> files = mpr.getFiles('images')
        if (files.getFirst().getSize() > 0) {
            def optionImage = OptionImage.findAllByOption(option)
            def count = optionImage.size() + 1
            files.each {
                String fileName = System.currentTimeMillis() + it.getOriginalFilename()
                File destinationFile = new File(path, fileName)
                it.transferTo(destinationFile)
                OptionImage image = new OptionImage()
                image.image = fileName
                image.option = option
                image.hierarchy = count
                image.save(failOnError: true)
                count += 1
            }
        }

        redirect(action: 'index', controller: 'product')
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def remove_image(String images) {
        println(images)
        if (images.contains('~')) {
            def i = images.split('~')
            for (each in i) {
                def optionImage = OptionImage.get(each as Integer)
                println(optionImage)
                def file = new File(path, optionImage.image)
                file.delete()
                optionImage.delete()
            }
        } else {
            def optionImage = OptionImage.get(images as Integer)
            println(optionImage)
            def file = new File(path, optionImage.image)
            file.delete()
            optionImage.delete()
        }
        response<<true
    }

    @Secured('ROLE_ADMIN')
    @Transactional
    def remove_size(int id) {
        def size = OptionSize.get(id as Integer)
        println(size)
        size.delete()
        response << true
    }

    @Secured('ROLE_ADMIN')
    @Transactional
    def remove(int id)
    {
        def option= Options.get(id)
        int pid=option.product.id
        def optionSizes=OptionSize.findAllByOption(option)
        for (size in optionSizes)
        {
            size.delete()
        }
        def optionImages=OptionImage.findAllByOption(option)
        for(image in optionImages)
        {
            def file = new File(path, image.image)
            file.delete()
            image.delete()
        }
        option.delete()
        redirect(action: 'index',id:pid)
    }
}
