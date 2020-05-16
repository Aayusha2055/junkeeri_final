package junkeeri

class Discount {

    String offer
    String type
    Integer rate
    Date validFrom
    Date validTill
    static constraints = {
        type inList: ['Percentage','Amount']
    }
}
