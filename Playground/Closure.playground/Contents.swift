// Closure
let helloClosure = {
    print("Hello everybody")
}
helloClosure()
type(of: helloClosure)

let eatClosure:(String)->() = {
    (foodName:String) in
    print("I want to have \(foodName)")
}
eatClosure("Apple pie")
type(of: eatClosure)

//let addClosure = {
//    (number1:Int, number2:Int) -> Int in
//    return number1 + number2
//}
let addClosure:(Int,Int)->Int = { $0 + $1 }

addClosure(3, 5)
type(of: addClosure)

func calculate(num1:Int,num2:Int,operation:(Int,Int)->Int){
    print(operation(num1,num2))
}
calculate(num1: 3, num2: 8, operation: addClosure)

//let mulClosure = {
//    (num1:Int,num2:Int) -> String in
//    return "\(num1) * \(num2) = \(num1 * num2)"
//}
let mulClosure:(Int,Int)->String = { "\($0) * \($1) = \($0 * $1)" }

func getMul() -> (Int,Int) -> String{
    return mulClosure
}
let doMul = getMul()
doMul(5,8)

