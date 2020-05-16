package junkeeri

import grails.gorm.transactions.Transactional
import org.springframework.security.access.annotation.Secured
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

@Secured('permitAll')
@Transactional
class LandingPageController {
    String path = servletContext.getRealPath("/") + "featured/"

    def index() {
        def contact=Contacts.first()
//        def about=About.first()
        def featured=Featured.list()
        [contact:contact, featured:featured]
    }

    def editAbout() {

    }

    def addFeatured(){
        def featured= new Featured()
        featured.name=params.name
        featured.title=params.title
        featured.link=params.link
        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request;
        MultipartFile photo = mpr.getFile('image')
        String fileName = System.currentTimeMillis() + photo.getOriginalFilename()
        File destinationFile = new File(path, fileName)
        photo.transferTo(destinationFile)
        featured.image=fileName
        featured.save(failOnError:true)
        redirect(action: 'index')
    }

    def editFeatured(){
        def featured= Featured.get(params.id)
        featured.name=params.name
        featured.title=params.title
        featured.link=params.link
        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request;
        MultipartFile photo = mpr.getFile('image')
        String fileName = System.currentTimeMillis() + photo.getOriginalFilename()
        File destinationFile = new File(path, fileName)
        photo.transferTo(destinationFile)
        featured.image=fileName
        featured.save(failOnError:true)
        redirect(action: 'index')
    }

    def deleteFeatured(int id){
        def featured=Featured.get(id)
        File current = new File(path + featured.image)
//        current.delete()
        featured.delete()
        redirect(action: 'index')
    }

    def editContacts()
    {
        Contacts contacts= Contacts.first()
        println(contacts)
        contacts.email=params.email
        contacts.numbers=params.numbers
        contacts.address=params.address
        contacts.facebook=params.facebook
        contacts.instagram=params.instagram
        contacts.save()
        redirect(action:'index')

    }
    def contactDetails()
    {
        def contact=Contacts.first()
        [contact: contact]
    }

    def image(int id) {
        def featured= Featured.get(id)
        File image = new File(path + featured.image)
        response.setContentType("application/jpg")
        OutputStream out = response.getOutputStream()
        out.write(image.bytes)
        out.close()
    }
}
