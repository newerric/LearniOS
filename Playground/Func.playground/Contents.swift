// func
func makeCake() -> Void{
    print("Cream the egg and sugar")
    print("Add Butter to it")
    print("Add Flour to it and mix")
    print("Bake it with oven")
}

//makeCake()

func eat(foodname name:String, drink: String){
    print("I want to have \(name), drink \(drink)")
}
eat(foodname: "Hamburger", drink: "Green tea")

func Add(number1:Int, number2:Int) -> Int{
    return number1 + number2
}
Add(number1: 5, number2: 3)

func multiply(number1:Int, number2:Int) -> Int{
    return number1 * number2
}
multiply(number1: 5, number2: 3)

func calculateArea(withWidth width:Float,andHeight height:Float) -> Float{
    return width * height
}
calculateArea(withWidth: 5, andHeight: 6)


