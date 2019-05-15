let name = "Mike"

switch name {
case "Mike":
    print("That's me")
case "David":
    print("That's my dad")
case "Bonnie":
    print("That's my sister")
default:
    print("who are you")
}

let price = 181

switch price {
case 200...400:
    print("too expensive")
case 100..<181:
    print("ok")
default:
    print("the price has to be 200, 100, or 50")
}

// loopbasic
var animalArray = ["cat","dog","lion","tiger"]

for animal in animalArray{
    print(animal)
}

let numberArray = [1,2,3,4,5,6,7,8,9,10]

for number in numberArray{
    print(number)
}

var num1 = 0
var num2 = 0
for index in 1...5 {
    num1 += index
}
num1

for index in 1..<4{
    num2 += index
}
num2 % 6

for index in 1...10 where index % 2 == 0 {
    print(index)
}

var fruitDic = ["red":"apple","yellow":"banana","green":"mango"]

for (key,value) in fruitDic{
    print(key + ":" + value)
}

// tuple
let colors = ("red","orange","yellow","green","blue")
colors.0 // red

let someTuple = ("hello", 2.14, true, ["apple","banana"])
someTuple.3[1]

var fruitTuple = (red:"apple", yellow:"banana", greed: "mango")
fruitTuple.red
fruitTuple.0
type(of: fruitTuple)

// while
var index = 1
while index <= 10{
    print(index)
    index+=1
}

repeat {
    print("repeat execute once")
} while index <= 1



