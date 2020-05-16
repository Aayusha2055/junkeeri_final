package junkeeri


class Product {
    String name
    String description
    String shipping
    String features
    String brand
    String instruction
    Integer price
    Division division
    Category category
    String status
    Integer total_sales
    static  mapping = {
        shipping sqlType: 'longText'
        instruction sqlType: 'longText'
        features sqlType: 'longText'
        description sqlType: 'longText'
    }
    static constraints = {
        status inList: ['Restocked','Sold Out','Available']
    }
}
