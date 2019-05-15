class Person{
    var firstname = "mike"
    var lastname = "wang"
    var fullname:String
    var heart:Heart?
    
    init(){
        fullname = firstname + lastname
        print("a person is begin initialized")
    }
    deinit{
        print("a person is being deinitialized")
    }
}

class Heart{
    // weak弱參考，不會增加使使用記憶體變數的個數，不一定需要，不負責維持記憶體
    weak var person:Person?
    init(){
        print("a heart is begin initialized")
    }
    deinit{
        print("a heart  is begin deinitialized")
    }
}


var p1:Person? = Person()
var h1:Heart? = Heart()

// retain cycle
p1?.heart = h1
h1?.person = p1

p1 = nil
h1 = nil
