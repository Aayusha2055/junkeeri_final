package junkeeri

import demo.Role
import demo.User
import demo.UserRole
import grails.gorm.transactions.Transactional
@Transactional
class BootStrap {

    def init = { servletContext ->
        Role userRole = Role.findOrSaveByAuthority('ROLE_ADMIN')
        userRole.save(flush: true)
        if (!User.findByUsername('adminJunkeeri')) {
            User userAdmin = User.findOrCreateWhere(username: 'adminJunkeeri', password: 'enterYourPassword')
            userAdmin.save(flush: true)
            UserRole role= UserRole.findOrSaveWhere(user: userAdmin, role: userRole)
            role.save(flush:true)
        }

    }
    def destroy = {
    }
}
