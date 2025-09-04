//: [Previous](@previous)
/*:
 ## Equatable
 
 The equality operator == is used to compare similar types for equality and the inequality operator != is used to compare similar types for inequality. The types themselves must conform to the Equatable protocol to define how they are equal or not. Most of the types defined in the Swift standard library such as Int, String and Double already conform to Equatable.
 
 When we create a type using a struct or enum we get automatic conformance to Equatable provided all the struct's properties conform to Equatable or all the enum's associated values conform to Equatable. If these conditions are not met then we must explicitly make our type conform to Equatable. This is done by implementing the equality operator == to a static method and defining how the left hand and right hand side of a property compare.
 
    struct User {
        let id: String
        let name: String
        let age: Int
    }
 
    extension User: Equatable {
        static func == (lhs: User, rhs: User) -> Bool {
            return lhs.id == rhs.id
        }
    }
 
*/

//: [Next](@next)
let name = "Tom"

let saveName = "Tom"

if saveName == "Tom"{
    print("They are the same")
} else {
    print("The name wrong")
}


struct User{
    var id: String
    var name: String
    var age: Int
}


extension User: Equatable{
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id

    }
}



let user1 = User(id: "123", name: "Tom", age: 30)
let user2 = User(id: "2", name: "Tom", age: 35)

if user1 == user2 {
    
    print("The user name same value")
    
} else {
    print("The user is not the same")
}

