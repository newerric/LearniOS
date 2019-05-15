var numberArray = [1,3,5,6,7,2,4,6,8,10]

//let numberArrayAddTen =  numberArray.map({
//    (number:Int) in
//    return number + 10
//})
//let numberArrayAddTen =  numberArray.map({ $0 + 10 })
//let numberArrayAddTen =  numberArray.map(){ $0 + 10 }
let numberArrayAddTen =  numberArray.map{ $0 + 10 }
numberArrayAddTen

//let numberArrayToString = numberArray.map({ "This is number \($0)" })
//let numberArrayToString = numberArray.map(){ "This is number \($0)" }
let numberArrayToString = numberArray.map{ "This is number \($0)" }
numberArrayToString

//var evenNumbers = numberArray.filter({
//    (number:Int) -> Bool in
//    return number % 2 == 0
//})
//var evenNumbers = numberArray.filter({ $0 % 2 == 0 })
//var evenNumbers = numberArray.filter(){ $0 % 2 == 0 }
var evenNumbers = numberArray.filter{ $0 % 2 == 0 }
evenNumbers

var moerThan5Numbers = numberArray.filter { $0 > 5 }
moerThan5Numbers
