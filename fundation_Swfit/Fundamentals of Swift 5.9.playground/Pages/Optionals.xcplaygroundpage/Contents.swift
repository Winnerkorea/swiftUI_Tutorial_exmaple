//: [Previous](@previous)
/*:
 ## Optionals
 */

/*:
 ![question mark](question.png)
 */

/*:
Optional variables can hold onto to a special value called `nil` which means **no value**. To declare an optional variable, we use a question mark `?` right after we specify the type of the variable.
 
    var myName: String?
    var myAge = 2
 
 Notice the difference between the two variables in this example. The first variable `myName` is an optional. It currently holds the value `nil` meaning no value because nothing was assigned to it. The second variable `myAge` is not optional. It holds onto the value 2.
 
 ### Optionals - Unwrapping
 
 Optionals need to be unwrapped before use. Unwrapping is safely uncovering if an optional has a value or `nil`.
 
*Force unwrapping* an optional means making an assumption it holds onto a value and not `nil`. We use `!` to force unwrap an optional.
 
     var apples: Int?
     apples = 2
     let bananas = 2
     let totalFruits = apples! + bananas
 
 In the above example, we force unwrap *apples* to add it to the number of *bananas*. This compiles correctly because apples was assigned a value 2 before it was force unwrapped and used in the sum of apples and bananas.
 
 If we are confident a variable will have a value when it is first used but decide it does not have a value when it is declared then we define it as an *implicit optional*. Implicit optionals hold onto `nil` when declared and do not need to be unwrapped. An implicit optional is defined with a `!` when declared.
 
     var apples: Int!
     apples = 2
     let bananas = 2
     let totalFruits = apples + bananas
 
 
 Optional binding is when we unwrap an optional and extract the value into a non-optional variable or constant. This is the safe way of unwrapping an optional because no assumptions are made if it has a value.
 
 *If-Let/Var* optional binding involves using an **if...let** or an **if...var statement** to bind the value of an optional if it exists. The limitation of If-Let/Var is that the bound value can only be used in the scope of the **if...let** or **if...var** statement.
 
     var apples: Int?
     apples = 2
     let bananas = 2
     if let apples = apples {
        let totalFruits = apples + bananas
     }
 
 *Guard-Let/Var* optional binding is where **guard...let** or **guard...var** is used to bind the value of an optional but the bound value can be used in the same scope. If the optional has no value then we exit out of scope we are in typically with a `return` statement.
 
     var apples: Int?
     apples = 2
     let bananas = 2
     guard let apples = apples else {
        return
     }
     let totalFruits = apples + bananas

*/
//: [Next](@next)

var optionalAge : Int?

if let unwrappedAge = optionalAge {
    print("언래핑된 값 : \(unwrappedAge)")
}







