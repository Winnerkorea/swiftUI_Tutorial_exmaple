//: [Previous](@previous)
/*:
## Identity
 
 Many of SwiftUI's types such as ForEach and List require some kind of id which provides identity. The concept of identiy is essential to how SwiftUI works. SwiftUI views are built on structures whose entire value is reevaulated when there is a change of state. Consider this example.
 
    import SwiftUI
 
    struct UserView: View {
 
        @State var name = ""
     
        var body: some View {
            Text(name)
        }
    
    }
 
 If there is a change to name the UserView structure is reevalauted and updates the Text element in the body. Now consider this example.
 
     import SwiftUI

     struct UserView: View {

         @State var names = ["Paul", "Tom", "Laura"]
      
         var body: some View {
             VStack {
                 ForEach(names, id: \.self) { name in
                     Text(name)
                 }
             }
         }

     }
 
 This time we iterate through an array and create Text views for each name in the array. SwiftUI needs a way to identify each Text element with its underlying name. It uses an id to uniquely tie each name to a Text view. This is important because if we add a new name into the array or subtract one the structure will reevaluate itself to update the number of names showing. That reevaluation needs to be aware of exisiting names tied to Text views and it needs an stable id that does not change with every reevaualtion.
 
 When we work with SwiftUI views that require an id we can either:
 
 1. Point to the property of the type that should be used as an id.
 2. Make the type conform to Identifiable.
 
 In the example above, we tell the ForEach loop that each name itself can be used as an id. This is possible with types that conform to Hashable because the type can be represented by a unique hash key. So if you are iterating through an array with a primitive type such as Int, Double or String you will probably pass `self` when asked for an id.
 
*/

//: [Next](@next)


