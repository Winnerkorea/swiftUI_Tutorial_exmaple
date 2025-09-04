/*:
 ## Hashable
 
 Hashable is a protocol. Any type that conforms to Hashable can be represent itself with a unique value called a hash. The hash is created using a special function that takes in the combined properties that should make the hash.
 
    - Note:
    Hashable uses Equatable as its base protocol. This means any type that attempts to conform to Hashable must also conform to Equatable.
 
 Types that conform to Hashable are often used as part of a Set. A Set is an unordered collection of unique elements. The elements are guaranteed to be unique because they conform to Hashable.

    let grades: Set = [4, 5, 7, 2]

 The keys of a dictionary conform to Hashable. This makes sense because you dictionary keys are always unique. You can never have the same key more than  once in a dictionary.

    let studentsAndGrades: [String: Int] = ["Paul": 80, "Laura": 90]

 Primitive types like Int, String and Double already conform to Hashable. We can create our own types that conform to Hashable. If all the properties of a Struct conform to Hashable then the entire Struct can adopt Hashable without any modification.

    struct User: Hashable {
        let name: String
        let age: Int
    }

 If the Struct contains any property that does not conform to Hashable then it must explicitly conform to Hashable. This is done by proving a == function and implementing the hash(into:) method.

        struct Account {
            let id: String
            let user: User
            let dateCreated: Date
        }

        extension Account: Hashable {
            static func == (lhs: Account, rhs: Account) -> Bool {
                return lhs.id == rhs.id
            }

            func hash(into hasher: inout Hasher) {
                hasher.combine(id)
            }
        }

 Hashable is particularly important in SwiftUI because it allows a type to use itself as an identifier in a ForEach loop. A ForEach loop needs an id for each element of an array so that SwiftUI can uniquely identify them. This is done by conforming to the Identifiable protocol but you can't make primitive types like String or Int conform to Identifiable. Since primitive types conform to Hashable you can use an instance of the type itself as an id to a ForEach using \.self.
*/

//: [Next](@next)
var grades: Set = [4, 5, 7, 2]


grades.insert(4)

print(grades)
print(grades.count)

grades.insert(8)

print(grades)
print(grades.count)


let studentGrades:[String: Int] = ["Paul":80, "Laura":90]

print(studentGrades)

import Foundation

struct User: Hashable {
    var name: String
    var age: Int
}

struct Account {
    var id: String
    var user: User
    var dateCreated: Date
}

extension Account: Hashable {
    func hash(into hasher: inout Hasher){
        hasher.combine(id)
    }
    
    // Equatable 준수를 위한 함수 (Hashable은 Equatable을 상속받으므로 필수)
    static func === (lhs:Account, rhs:Account) -> Bool {
        lhs.id == rhs.id
    }
}
