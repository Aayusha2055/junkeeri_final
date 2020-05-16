package junkeeri

class Customer {
    String name
    String email
    String numbers
    Date date
    String paymentMethod
    String deliveryStatus
    Integer total
    static constraints = {
        deliveryStatus inList: ['Completed','Pending']
        paymentMethod inList: ['Cash on Delivery','Khalti']
    }
}
