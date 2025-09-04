//: [Previous](@previous)
/*:
 ## Classes
 Classes are **reference** types. When you pass an instance to a variable or constant a reference to same instance is assigned. It is possible for multiple constants and variables to refer to the same instance of a class. This is known as reference counting.
 
An instance of a class is created through *initialization*. Unlike structures, classes do not have memberwise initialization. This means that you need to have default values for all your properties or to at least provide the values at initialization in order to successfully create an instance of a class.
*/

//: [Next](@next)
class Dog {
    var name: String

    init(name: String) {  // 반드시 필요!
        self.name = name
    }
}

let maxDog = Dog(name: "Max")
let maxDog2 = maxDog  // 같은 객체를 참조!

maxDog.name = "Paul"
print(maxDog.name)   // "Paul"
print(maxDog2.name)  // "Paul" (같이 변경됨!)


struct Cat {
    var name: String
    // 초기화자 없어도 자동 생성됨
}

var tomCat = Cat(name: "Tom")
var tomCat2 = tomCat  // 복사본 생성!

tomCat2.name = "Tim"
print(tomCat.name)   // "Tom" (변경되지 않음)
print(tomCat2.name)  // "Tim"
