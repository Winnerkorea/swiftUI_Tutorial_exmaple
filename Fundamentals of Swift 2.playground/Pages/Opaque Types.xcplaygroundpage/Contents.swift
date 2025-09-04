//: [Previous](@previous)
/*:
 ## Opaque Types
 
 You'll notice SwiftUI uses to some keyword when returning a View.
 
     struct UserView: View {
      
         var body: some View {
             VStack {
                 Text("Hello World")
             }
         }

     }
 
 This is referred to as an opaque type. View itself is a protocol so the body expects anything that conforms to View such as a Text or Button. It is neccessary to instruct the body to expect some View and not just View because not all View's are the same. While a Text and a Button are both types that conform to View they are not the same type. A Text is Text and a Button is a Button. The body needs to know exactly what type of View is being returned but this information is hidden behind a protocol. By using some View which means we return an opaque type, Swift is allowed to uncover the exact type which conforms to View.
 
 
 
*/

//: [Next](@next)

