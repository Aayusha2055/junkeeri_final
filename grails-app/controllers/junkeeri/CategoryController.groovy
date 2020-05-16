package junkeeri

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class CategoryController {

    def index() {
        def category=Category.list()
        [category:category]
    }

    def create(){
        def division=Division.list()
        [division: division]
    }
    def store()
    {
        def category=new Category()
        def division=Division.get(params.category)
        category.division=division
        category.name=params.name
        category.save()
        redirect(action:'index')

    }
    def edit(int id)
    {
        def category=Category.get(id)
        def division=Division.list()
        [category: category,id:id,division: division]
    }

    @Transactional
    def update(int id)
    {
        def category=Category.get(id)
        def division=Division.get(params.category)
        category.division=division
        category.name=params.name
        category.save(flush:true,failOnError:true)
        redirect(action:'index')
    }

    @Transactional
    def remove(int id)
    {
        def category=Category.get(id)
        def division=Division.get(category.categoryId)
        division.delete()
        println(category.id)
        category.delete(failOnError:true)
        redirect(action:'index')

    }
    
}
