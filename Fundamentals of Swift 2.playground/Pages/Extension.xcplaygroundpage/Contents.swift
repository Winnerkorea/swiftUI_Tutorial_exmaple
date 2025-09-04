/*:
 ## Extensions
 
 Extensions add new functionality to an exisiting type.
 
 Let's say you have a struct representing a user.
 
     struct User {
         var firstName: String
         var lastName: String
         var age: Int
         var bio: String
         var fullName: String {
             return firstName + " " + lastName
         }
         
         mutating func change(age: Int) {
             self.age = age
         }
     }

 We can shift the function and computed property into an extension instead of having it in the body of the struct.

    extension User {
        
        var fullName: String {
            return firstName + " " + lastName
        }
        
        mutating func change(age: Int) {
            self.age = age
        }
        
    }

 From the example above, it is clear an extension allows us to write computed properties and functions that would otherwise be in the body of the type. 
 
 ### When To Use Extensions
 
 
 1. Extensions allow a clean way of seperating conformance to the protocol from the body of the type. Protocols are discussed later in this playground.
 2. Extensions can be used as a way of grouping related functions and computed properties together.
 3. Extensions can be used to add functionality to existing types that we do not have access to.
 */
