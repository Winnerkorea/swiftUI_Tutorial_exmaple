//: [Previous](@previous)
/*:
 ## Functions - Fundamentals
 Functions are self-contained chunks of code that perform a **specific task**. A function is defined by a name by which we can call it by. It can take inputs known as **parameters** and it performs some kind of operation in its *scope* or *block*. A function can optionally return some kind of output after its operation. Functions help to reduce complexity in our code and make our code more reusable.
 
    let firstName = "Jane"
    let lastName = "Doe"
    func createFullName(firstName: String, lastName: String) -> String {
        return firstName + " " + lastName
    }
 
 ![factory](factory.png)
 
 Functions can come with both **arguement labels** and **parameter names**. The arguement label is used when calling the function. The parameter name is used in the implementation of the function. Using arguement labels and parameter names makes our code more readable.
 
    var numberOfStudents = 30
    func add(studentsCount count: Int) {
        numberOfStudents += count
    }
    add(studentsCount: 5)
 
 Function parameters are constants by default. If you wish to change the value of a parameter inside of a function then you need to define it as an **in-out parameter**. This is done by placing the `inout` keyword before the parameter's type. You only pass a variable as the arguement for an in-out parameter.
 
    func addNumber(toName name: inout String) -> String {
        name = name + "123"
        return name
    }
    var name = "Paul"
    addNumber(toName: &name)
 
 ### Naming
 
 The Swift API Guidelines gives us suggestions on how to name our functions.
 * Prefer method and function names that form grammatical English phrases
 * Begin names of factory methods with `make`
 * Name functions and methods according to their side-effects
 * Take advantage of defaulted parameters
 * Prefer to locate parameters with defaults toward the end
 * Omit all labels when arguements can't be usefully distinguished
 
*/
//: [Next](@next)





