var x:Int? = 8
// Force-unwrap the value to avoid this warning
x! + 2

if x != nil{
    x = x! + 1
}

//print(x ?? <#default value#>)
//print(x as Any)

// Optional binding
if let myNumber = x {
    myNumber + 1
}

var luckyNumber:Int! = 8
type(of: luckyNumber)
print(luckyNumber)

var hightcore:Int
var loadedScore:Int? = 1000
// Nil-Coalescing Operator
hightcore = loadedScore ?? 0




var three:String = "I Love you"
var isOn = true
