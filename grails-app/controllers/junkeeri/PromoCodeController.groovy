package junkeeri

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

import java.text.SimpleDateFormat

class PromoCodeController {
    SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd")

    @Secured('ROLE_ADMIN')
    def index() {
        def promoCode=PromoCode.listOrderByValidFrom(order:'desc')
        [promoCode:promoCode]
    }

    @Secured('ROLE_ADMIN')
    def store()
    {
        def promoCode = new PromoCode()
        promoCode.title = params.title
        promoCode.type=params.offerType
        promoCode.description = params.description
        Date validFrom = sdformat.parse(params.validFrom_year+"-"+params.validFrom_month+"-"+params.validFrom_day)
        Date validTill = sdformat.parse(params.validTo_year+"-"+params.validTo_month+"-"+params.validTo_day)
        if(validFrom>validTill)
        {
            redirect(action: 'index')
        }
        promoCode.validFrom = validFrom
        promoCode.validTill = validTill
        promoCode.rate = params.rate as Integer
        promoCode.save(failOnError: true)
        redirect(action: 'index')
    }

    @Secured('ROLE_ADMIN')
    def edit(int id)
    {
        def promoCode=PromoCode.get(id)
        [promoCode: promoCode]
    }


    @Transactional
    @Secured('ROLE_ADMIN')
    def update(int id)
    {
        def promoCode=PromoCode.get(id)
        promoCode.title = params.title
        promoCode.type=params.offerType
        promoCode.description = params.description
        Date validFrom = sdformat.parse(params.validFrom_year+"-"+params.validFrom_month+"-"+params.validFrom_day)
        Date validTill = sdformat.parse(params.validTo_year+"-"+params.validTo_month+"-"+params.validTo_day)
        if(validFrom>validTill)
        {
            redirect(action: 'index')
        }
        else{
            promoCode.validFrom = validFrom
            promoCode.validTill = validTill
            promoCode.rate = params.rate as Integer
            promoCode.save(failOnError: true)
            redirect(action: 'index')
        }
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def remove(int id){
        def promoCode=PromoCode.get(id)
        promoCode.delete()
        redirect(action: 'index')
    }

}
