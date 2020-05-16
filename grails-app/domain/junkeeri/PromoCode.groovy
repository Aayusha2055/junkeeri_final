package junkeeri

class PromoCode {
    String title
    String description
    Integer rate
    String type
    Date validFrom
    Date validTill
    static constraints = {
        type inList: ['Rate','Amount']
    }
}
