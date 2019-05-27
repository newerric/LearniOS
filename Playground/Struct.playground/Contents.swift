struct Size {
    var width: Float = 5.0
    var height: Float = 8.0
    func area() -> Float {
        return width * height
    }
}

var aSize:Size = Size(width: 20.0, height: 30.0)
aSize.width
aSize.height = 50.0
aSize.height

var newSize = Size()
newSize.width
newSize.area()

struct Name {
    var firstname: String
    var lastname: String
    func fullname() -> String {
        return firstname + lastname
    }
}

var myName = Name(firstname: "Mike", lastname: "Ceo")
myName.fullname()
