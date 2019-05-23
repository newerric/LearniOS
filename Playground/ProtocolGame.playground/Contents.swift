// Protocol Game

protocol MankindType {
    var health: Int { get set }
}

protocol Attackable {
    func attack(target: Hurtable)
}

protocol Hurtable: MankindType {
    func getHurt()
}


class Man: MankindType, Hurtable {
    var health: Int
    init() {
        health = 10
    }
    
    func getHurt() {
        health -= 10
    }
}

class Batman: MankindType, Hurtable, Attackable {
    var health: Int
    init() {
        health = 1000
    }
    
    func getHurt() {
        health -= 5
    }
    
    func attack(target: Hurtable) {
        //print("attack with fist")
        target.getHurt()
    }
}

class Superman: MankindType, Hurtable, Attackable  {
    var health: Int
    init() {
        health = 10000
    }
    
    func getHurt() {
        health -= 1
    }
    
    func attack(target: Hurtable) {
        //print("attack with eye laser")
        target.getHurt()
    }
}



