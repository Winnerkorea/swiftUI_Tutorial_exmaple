//: [Previous](@previous)
/*:
 ## Protocols
 A protocol defines a blueprint of methods, properties and other requirements that adopting classes, structures or enumerations must conform to. Protocols do not implement any functionlaity themselves but become fully-fledged types when used.
 
 When specifying the property requirements of a protocol all properties must be declared as variables. A protocol requires that a property is declared as gettable or settable which allows for a lot of flexibility in making the actual property a stored or computed property.
 
 When specifying the method requirements of a protocol all you need is the method name but without the curly braces.
 
 In the following example, we have the protocol Fruit. The structures Orange and Apple conform to Fruit so they must include the properties of the Fruit protocol.
 
    protocol Fruit {
        var color: String { get set }
        var helpsImmunity: Bool { get }
        var helpsDigestion: Bool { get }
    }
 
    struct Orange: Fruit {
        var color = "orange"
        let helpsImmunity = true
        let helpsDigestion = true
    }
 
     struct Apple {
         let name = "Apple"
         let type = "Fuji"
         var color: String = "red"
     }
 
     extension Apple: Fruit {
        var helpsImmunity: Bool { true }
        var helpsDigestion: Bool { true }
        
     }
 
*/

//: [Next](@next)
protocol Fruit {
    var color: String { get }
    var helpsImmunity: Bool { get }
    var helpsDigestion: Bool { get }

}

protocol Food {
    func canBeEaten()
}

struct Orange {
    // 프로토콜과 관련 없는 프로퍼티들
    var weight: Double = 150.0

    func someOtherFunction() {
        // ...
    }
}

// 프로토콜 준수를 위한 코드를 익스텐션으로 분리
extension Orange: Fruit {
    var color: String { "Orange" } // 저장 프로퍼티는 안되므로 연산 프로퍼티로 변경
    var helpsImmunity: Bool { true }
    var helpsDigestion: Bool { true }

    
}

struct Apple:Fruit{
    var color: String
    var helpsImmunity = true
    var helpsDigestion = true
    
    func canBeEaten(){
        print("You can eat this apple")
    }
}


extension Orange: Food{
    func canBeEaten() {
        print("You can eat this orange.")
    }
}


let myOrange = Orange()
let myApple = Apple(color: "Red")

let randomFruit : Fruit

randomFruit = myOrange
//randomFruit = myApple


//print(randomFruit)
print(randomFruit)

if let revertedOrange = randomFruit as? Orange {
    print("Sucessfully converted back to Orange.")
    print(revertedOrange.weight)
} else {
    print("Could not convert to Orange, it might be an Apple or something else.")
}

