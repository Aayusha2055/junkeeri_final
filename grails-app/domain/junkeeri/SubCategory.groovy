package junkeeri

class SubCategory {

    String name
    static constraints = {
        name unique: true
    }
}
