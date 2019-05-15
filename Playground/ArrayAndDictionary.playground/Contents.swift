var animalArray = ["cat","dog","lion","tiger"]
animalArray[0]
animalArray.count

animalArray.append("rabbit")
print(animalArray)


animalArray.insert("cow", at: 2)

animalArray.remove(at: 0)
print(animalArray)

animalArray.removeLast()
animalArray
type(of: animalArray)
animalArray.reverse()

var anotherAnimalArray:[String] = ["pony", "sheep", "monkey"]
var twoArray = animalArray + anotherAnimalArray

print(twoArray)

twoArray.sort()
print(twoArray)

var numbers = [1,3,8,4,5]
numbers.sort()

//var numerBag:[Int] = []
var numberBag = [Int]()

// Dictionary
var fruitDic = ["red":"apple","yellow":"banana","green":"mango"]
fruitDic["red"]
fruitDic["black"]
print(fruitDic)

fruitDic["green"] = "watermelon"
fruitDic.updateValue("cherry", forKey: "pink")
fruitDic["orange"] = "orange"

fruitDic["red"] = nil
fruitDic.removeValue(forKey: "green")

var scores = ["english":90, "chinese":85, "sport":75]
type(of: scores)
type(of: scores["red"])
