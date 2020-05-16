package junkeeri

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

class DivisionController {
    String path = servletContext.getRealPath("/") + "divisions/"

    @Secured('ROLE_ADMIN')
    def index() {
        def division = Division.list()
        [division: division]
    }

    @Secured('ROLE_ADMIN')
    def store() {
        def division = new Division()
        division.name = params.name
        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request;
        MultipartFile photo = mpr.getFile('image')
        String fileName = System.currentTimeMillis() + photo.getOriginalFilename()
        File destinationFile = new File(path, fileName)
        photo.transferTo(destinationFile)
        division.image = fileName
        division.save()
        redirect(action: 'index')
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def update() {
        Division division = Division.get(params.id)
        division.name = params.name
        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request;
        MultipartFile photo = mpr.getFile('image')
        if (photo.getSize() > 0) {
            File current = new File(path + division.image)
            current.delete()
            String fileName = System.currentTimeMillis() + photo.getOriginalFilename()
            File destinationFile = new File(path, fileName)
            photo.transferTo(destinationFile)
            division.image = fileName

        } else {
            division.image = division.image

        }
        division.save(flush: true, failOnError: true)
        redirect(action: 'index')
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def remove(int id) {
        Division division = Division.get(id)
        File current = new File(path + division.image)
        current.delete()

        division.delete()
        redirect(action: 'index')

    }

    @Secured('permitAll')
    def image(int id) {
        def division= Division.get(id)
        File image = new File(path + division.image)
        response.setContentType("application/jpg")
        OutputStream out = response.getOutputStream()
        out.write(image.bytes)
        out.close()
    }
}
