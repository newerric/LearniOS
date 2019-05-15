class Lego{
    // property
    var color = "blue"
    var size = 8
    // method
    func connect(){
        print("connect with another block")
    }
    
    func remove(){
        print("disconnect with another block")
    }
}

// Instance (Object)
let oneBlock:Lego = Lego()

class Baby{
    var name:String
    var age:Int
    
    func sleep(){
        print("sleep")
    }
    func introduceSelf(){
        print("My name is \(name)")
    }
    
    // initialize
    init(){
        name = "Mike"
        age = 1
        print("a new baby is born")
        introduceSelf()
        sleep()
    }
    init(name:String,age:Int){
        self.name = name
        self.age = age
    }
}

//let baby1 = Baby()
//let baby2 = Baby(name: "bonnie", age: 3)

class CuteBaby:Baby{
    var nickname:String
    func danceAndSing(){
        print("dance and sing")
    }
    override func sleep() {
        super.sleep()
        print("sleep with cute smile")
        super.sleep()
    }
    override func introduceSelf() {
        print("My name is \(nickname)")
    }
    
    override init() {
        nickname = "QQ"
        super.init()
        // super class property
        name = "bonnie"
    }
}

let baby3 = CuteBaby()
baby3.danceAndSing()


