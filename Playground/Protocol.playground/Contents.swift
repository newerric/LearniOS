protocol SoyMillkGetable {
    func GiveMeSoyMilk()
}

class Brunch : SoyMillkGetable {
    func GiveMeSoyMilk() {
        print("SoyMilk")
    }
}

let aBrunch = Brunch()
aBrunch.GiveMeSoyMilk()

protocol MoneyTransferProtocl {
    func giveMoney()
}

class RichPeople: MoneyTransferProtocl {
    func giveMoney() {
        print("Give you 100 dollars")
    }
}

class PoorGuy {
    var helper: MoneyTransferProtocl?
    func needMoney() {
        helper?.giveMoney()
    }
}

class NormalPeople: MoneyTransferProtocl {
    func giveMoney() {
        print("give you 10 dollars")
    }
}

let aPoorGuy = PoorGuy()
let aRichPeople = RichPeople()
let aNormalPeople = NormalPeople()
aPoorGuy.helper = aRichPeople
aPoorGuy.needMoney()
aPoorGuy.helper = aNormalPeople
aPoorGuy.needMoney()

