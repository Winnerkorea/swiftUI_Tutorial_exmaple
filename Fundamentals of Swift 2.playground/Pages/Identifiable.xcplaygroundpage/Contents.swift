//: [Previous](@previous)
/*:
 
 ## Identifiable
 
Let's consider this structure of type User.
 
     struct User {
         let name: String
     }
 
 We have two ways of iterating through an array of type User using a ForEach loop. The first is to mention the property that will be used as an id. We only have one property in our User type so we will use the name property. The name property is a String which in turns means it conforms to Hashable so it is an appropriate id.
 
     struct UserView: View {

         @State var users: [User] = [User(name: "Paul"), User(name: "Tom"), User(name: "Laura")]
      
         var body: some View {
             VStack {
                 ForEach(users, id: \.name) { user in
                     Text(user.name)
                 }
             }
         }

     }
 
 Alternatively, we can ensure that our type User conforms to Identifiable. A type that conforms to Identifiable must provide an id property. Therefore, if we are to conform to Identifiable we must alter our User structure to include an id property. If a type conforms to Identifiable there is no need to explicitly mention the id in views that require an id.
 
     struct User: Identifiable {
         let id: String
         let name: String
     }
 
     struct UserView: View {

         @State var users: [User] = [User(id: "1", name: "Paul"), User(id: "2", name: "Tom"), User(id: "3", name: "Laura")]
      
         var body: some View {
             VStack {
                 ForEach(users) { user in
                     Text(user.name)
                 }
             }
         }

     }
 
 Sometimes we do not have an id for our models. In cases where you need an id but do not wish to actually use an id as part of your model simply create a constant id with an instance of UUID.
 
     struct User: Identifiable {
         let id = UUID()
         let name: String
     }
 
 
 */

//: [Next](@next)

