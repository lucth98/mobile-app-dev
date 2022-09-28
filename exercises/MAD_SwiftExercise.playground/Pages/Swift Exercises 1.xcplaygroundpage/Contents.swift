//: # Swift Exercise
//: Welcome to the Swift Exercise. This document is an interactive Playground. The goal of this exercise is to familiarize yourself with the Swift syntax, terminology and concepts.
//:
//: If this text you're currently reading is being displayed as a code comment with `//:`, you can make it look prettier by selecting `Editor` --> `Show Rendered Markup` in the menu bar at the very top of your screen. You can switch back to the raw markup by clicking `Editor` --> `Show Raw Markup`. The document is designed to be viewed in Rendered Markup mode.
//:
//: You can type your Swift code in here and it'll automatically compile.
//: If the automatic compilation annoys you, you can turn it off by clicking-and-holding your mouse on the "Play" icon in the toolbar below. Then, select `Manually Run`.
//:
//: If you need help or have any questions, please feel free to contact me. You can find my contact info on the [course website](https://avf.github.io/mobile-app-dev/). I'm always happy to help!
//:
//: ## How to do the exercises
//: - Follow the instructions for the exercises.
//: - Please write any code that I ask for right into the playground.
//: - Any time I ask a question in an exercise, **please add a comment with the explanation in your own words.**
//:
//: Here's an example:
//:
//: Write a Hello World program in Swift in a single line. Why is this a valid Swift program?

print("Hello, World!")
// This works because Swift programs by default execute statements in the global scope. A `main` function or similar is not required.

//: ## Exercises
//: ### Variables and Constants
//: 1. Declare a variable with value `42` that is implicitly assigned type `Int`.
//: 1. Declare a constant with value `42` that is implicitly assigned type `Int`.
//: 1. Declare a variable with value `42.5`. What type does it have?
//: 1. Declare a variable with explicit type `Float` and value `42.5`.
//: 1. Declare an uninitialized constant with type `String`. Will you ever be able to assign a value to this constant?
var number=42 //1.
let constantNumber=42//2.
var b=42.5//the default is double not float /3.
var exoFlooat:Float=42.5//4.
let myString:String
myString="new String"

print(myString)//it worked
//can be assigned 1 time

//myString="hh" //gives an error



//: ### Strings and String interpolation
//: 1. Create a constant of type `String` containing the text `"This is a String."`.
//: 1. Create a mutable String with `"This is an Int: "` as its initial value.
//: 1. Create an `Int` constant with value 42 and append it to the mutable string, resulting in the value: `"This is an Int: 42"`.
//: 1. Create another constant containing the same string, but this time use a string literal and string interpolation (the `\()` syntax) to create it.
//: 1. Create a multiline string using the multiline string literal.
let constString:String="This is a String"//1
var mutString="This is an int: "//2
let constInt=42
mutString+=String(constInt)
print(mutString)//3

var stringInterpolation="int = \(constInt)"
print(stringInterpolation)//4

var multiLineString="""
Line 1
Line 2
Line 3
"""

print(multiLineString)//5


//: ### Arrays and Dictionaries
//: Arrays
//: 1. Create an immutable array and initialize it with an array literal containing 3 `String` elements
//: 1. Create an empty mutable array of type `[String]`
//: 1. Append the second element of the first (immutable) array to the second (mutable) array.
//: 1. Can you modify one of the `String` elements in the first array (for example, append a word to it)? Why/why not? What if the elements were not of type `String`, but instead of a class?
//: 1. What happens if you modify the `String` element in the second array (for example, if you append a word to it)? Will the second element in the first array also change, or stay the same? Explain why.
//: 1. Create an immutable empty array of type `[Int]` without any literals, using the name of the class (`Array`) and the standard initializer for generic types (`var value = ClassName<GenericType>()`)
let immutableArrayOfStrings:[String]=["First String","Second String","Third String"]//1
var mutableArrayOfString:Array<String>=Array()//2

mutableArrayOfString.append(immutableArrayOfStrings[1])
print(mutableArrayOfString)//3

//4  no ----------------------
//5-------------------------------

let immutableArrayOfInt:Array<Int>=[1,2,3]
//immutableArrayOfInt.append(1)
print(immutableArrayOfInt)
//: Dictionaries
//: 1. Create a mutable empty Dictionary of type `[String: Double]`
//: 1. Set the value for the key `"Answer to Life, the Universe and Everything"` to `42`.

var dictionary:[String:Double]=[:]//1
dictionary["Answer to Life, the Universe and Everything"]=42.0//2

print(dictionary)
//: ### Optionals
//: 1. Create an optional `String` variable and assign a non-nil value of your choice
//: 1. Print the String on the console. Make sure the variable is first unwrapped and only the actual value is printed. You may either force-unwrap the string or use an `if let` construct.
//: 1. What happens if you force-unwrap an optional variable that contains `nil`?
//: 1. Create another optional `String` variable and asign the value `nil`. Use the nil coalescing operator (`??`) to print the first unwrapped String from above.
//: 1. Do the same thing again, but this time use the ternary conditional operator `(a ? b : c)`.
var optionalString:Optional<String>="Bla Bla"//1

if let exist = optionalString{
    print(exist)
}else{
    print("not defined")
}//2

/*
var anotherOptional:Optional<Bool>=nil
print(anotherOptional!)
 
 //3 Answer this error:Fatal error: Unexpectedly found nil while unwrapping an Optional value
 //see example
 */

var stringop:Optional<String>=nil
let opOutout=stringop ?? "not defined"
print(opOutout) //4


let opOutout2 = stringop==nil ? "not defined":stringop!
print(opOutout2) //5
//: Optional chaining
//: 1. Consider the following `struct`. Use optional chaining to change the value of `anOptionalInt` in `instance` to a new value of your choice in a single line of code. What would happen if we executed that line while `instance` is `nil`?
//: 1. Use the `if let` conditional and optional chaining to print the value of `anOptionalInt` in `instance`. What would happen if `instance` or `anOptionalInt` were `nil`?
//: 1. Use optional chaining to call the method `sayHelloWorld` of `instance`. What would happen if `instance` were `nil`?

struct MyStruct {
    var anOptionalInt: Int? = 5
    
    func sayHelloWorld() {
        print("Hello, World!")
    }
}

var instance: MyStruct? = MyStruct()
instance?.anOptionalInt?=15  //change value
print(instance?.anOptionalInt!)

 instance=nil //set nil
instance?.anOptionalInt?=15  //change value
print(instance?.anOptionalInt!) // there is no error
//end of 1.)


instance=MyStruct()
if let oInt = instance?.anOptionalInt{
    print(oInt)
}else{
    print("=nil")
}  //all works

instance?.anOptionalInt = nil

if let oInt = instance?.anOptionalInt{
    print(oInt)
}else{
    print("=nil")
}  //print =nill if varible is nil


instance = nil

if let oInt = instance?.anOptionalInt{
    print(oInt)
}else{
    print("=nil")
}  //print =nill if instance is nil

//end of 2.)






instance = MyStruct()
instance?.sayHelloWorld()//say hello word

instance = nil
instance?.sayHelloWorld()// no error no output




//: ### Control flow
//: 1. Write a `for-in` loop that sums up all the values in `myNumbers`.
//: 1. Create an empty mutable `[Int: Int]` dictionary. Use a `for-in` loop to iterate over the elements in `myNumbers` and add each value to the dictionary, using the index of each element in `myNumbers` as its key. So for example, the dictionary should contain the key/value pair `0:12`, because 12 is element 0 of `myNumbers`.

let myNumbers = [12, 23, 1, 104]

for number in myNumbers{
    print(number)
}
//end 1.)

var myNumbersDic:[Int:Int]=[:]


for (index,element) in myNumbers.enumerated(){
    myNumbersDic[index]=element
}

print("result:")
print(myNumbersDic)

//end 2.)




//: ### Functions and Closures
//: Functions
//: 1. Declare and call a function without any parameters or return type that prints Hello World.
//: 1. Declare and call a function that takes two strings as parameters and returns a string. Remember that in Swift, most funtions have argument labels. Make sure to include them, you don't need to modify the argument labels in any way.
//: 1. Declare and call a function with the same signature (two strings as parameters and returns a string), but this time remove the first argument label.
//: 1. Declare and call a function with the same signature (two strings as parameters and returns a string), but this time make the first argument label **different** from the parameter name (=use a custom argument label).
//: 1. Declare a function with a default parameter value. Call the function twice, once with the argument present, once without.
//: 1. Declare a function with name `callAFunction` that takes another function as parameter and then executes it. Call your newly declared `callAFunction` and pass in one of the functions you previously declared.
func printHelloWold(){
    print("hello world")
}
printHelloWold()
//end of 1.)

func stringFunction(firstLabel firstString:String,secondLabel secondString:String)->String{
    return firstString+secondString
}

print(stringFunction(firstLabel: "a", secondLabel: "b"))
//end 2.)


func stringFunction( firstString:String,secondLabel secondString:String)->String{
    return firstString+secondString
}

print(stringFunction(firstString: "c", secondLabel: "d"))
//end 3.)

func stringFunction(differentLabel firstString:String,secondLabel secondString:String)->String{
    return firstString+secondString
}

print(stringFunction(differentLabel: "e", secondLabel: "f"))
//end 4.)

func defaultParameterFunction(_ defaultPara:String="hallo")->String{
    return defaultPara;
}

print(defaultParameterFunction())
print(defaultParameterFunction("world"))
//end 5

func callAFunction(_ function:(String)->String){
    print(function("String"))
}

callAFunction(defaultParameterFunction)
//end 6
//: Closures
//: 1. Create an optional variable that holds a closure (with a `String` parameter and no return type) and assign `nil`.
//: 1. Call the closure using optional chaining. What will happen?
//: 1. Create a `typealias` for this type of closure.
var optClose:((String)->())? = nil
//end 1
optClose?("bla") //nothing happens
//end 2
typealias stringClosure=(String)->()
//end 3



//: 1. Take a look at the following function, which takes a closure as parameter and calls it. This function is then called. For each of the following exercises, call the function again, but each time use one more simplification:
//:   * Omit closure parameter types.
//:   * Omit the closure return type
//:   * Omit the round brackets and argument label (we can do that since it's the last function parameter)
//:   * Omit the closure parameters completely. In the closure body, use the shorthand argument names (for example `$0`)
//:   * Omit the keyword `return`

func callAClosure(closure: (String, String) -> String) {
    print(closure("Hello", "World"))
}
callAClosure(closure: { (item1: String, item2: String) -> String in
    return "\(item1) \(item2)"
})

callAClosure(closure: { (item1, item2) -> String in
    return "\(item1) \(item2)"
})  //1.) omit parmeter type

callAClosure(closure: { (item1, item2)   in
    return "\(item1) \(item2)"
})  //2.) omit return type

callAClosure(closure: { item1, item2   in
    return "\(item1) \(item2)"
})  //3.)

callAClosure(closure: {
    return "\($0) \($1)"
})  //4.)

callAClosure(closure: {
     "\($0) \($1)"
})  //5.)





//: ### Classes
//: 1. Create a new class named `Person`. Add non-optional `firstName` and `lastName` properties and an initializer.
//: 1. Add a `name` computed property that returns a `String` containing the first and last name.
//: 1. Add a method named `greet` that returns the following `String`: `"Hi, I'm \(name)."`
//: 1. Create a subclass of `Person` and name it `Student`.
//: 1. Add a `Float?` optional property called `grade`. Use the `didSet` property observer to make sure that the grade is not lower than 1.0 and not higher than 5.0 after it was set. Clamp the new value to this interval - so if a value higher than 5.0 is set, set it to 5.0 afterwards. If a value lower than 1.0 is set, set it to 1.0 afterwards.
//: 1. Override the `greet` function from the superclass. If the `grade` property is set, it should now return `"Hi, I'm \(name). My grade is: \(grade)"`. If the `grade property isn't set, return the superclass's implementation.
class Person{
    var firstName:String
    var lastName:String
    
    init(_ firstName:String,_ lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var name:String{
        return firstName + " " + lastName
    }
    
    func greet()->String{
        return "Hi, I'm \(name)."
    }
}

class Student:Person{
    var grade:Float?{
        didSet{
            if grade != nil{
                
                if grade! < 1.0{
                    grade = 1.0
                }else if grade! > 5.0 {
                    grade = 5.0
                }
            }
        }
    }
}



var student = Student("Max","Mustermann")
print(student.name)
student.grade=1000.54553
print(student.grade)

student.grade=0.0000001
print(student.grade)


//: ### Enums and Structs
//: 1. Create an enum named `PetType` with cases `dog` and `cat`
//: 1. In your new enum, create a function or computed property named `animalSound` that returns a `String`. Use a `switch` statement on `self` to differentiate between the cases and return `"woof"` for the `.dog` case and `"meow"` for the `.cat` case.
//: 1. Create a structure named `Pet`, with a `name` property of type `String` and a `type` constant of type `PetType` (both non-optional).
//: 1. Add a function to your structure named `makeNoise` that returns a `String`. In its implementation, return the `animalSound` of its `type`.
//: 1. Create 3 or more instances of your `Pet` struct and store them in `let` constants. Then create a new array that contains all your pets and store it in a variable.
//: 1. Change one of the names of the pets in your array. Does this change the name of any of the pets stored in the `let` constants? Explain why/why not.
//: 1. Can you change the name of one of the pets stored in the `let` constants? Explain why/why not.
//: 1. Create 3 or more instances of your `Student` class from above and store them in `let` constants. Then create a new array that contains all your students and store it in a variable.
//: 1. Change one of the names of the students in your array. Does this change the name of any of the students stored in the `let` constants? Explain why/why not.
//: 1. Can you change the name of one of the students stored in the `let` constants? Explain why/why not.
struct Pet {
    var name:String
    var type:PetType
    
    init(_ name:String,_ type:PetType){
        self.name = name
        self.type = type
    }
    
    func makeNoise()-> String{
        return type.animalSound
    }
    
}

enum PetType{
     case dog
     case cat
    
    var animalSound:String{
        switch self{
        case .dog:
            return "woof"
        case .cat:
            return "meow"
        }
    }
}

var petType = PetType.cat
print(petType.animalSound)

let pet1 = Pet("Hund 1", PetType.dog)
let pet2 = Pet("Hund 2", PetType.dog)
let pet3 = Pet("Katze 1", PetType.cat)
let pet4 = Pet("Katze 2", PetType.cat)
let pet5 = Pet("Katze 3", PetType.cat)

var petArray:[Pet] = [pet1, pet2, pet3, pet4, pet5]

petArray[2].name = "snow" //6.) no it dos not chang in let becouse structs work with coy and not with references
print(petArray[2].name )
print(pet3.name )

//7.) no becouse there are constant
//pet3.name = "snow"   //-> gives an error

//weiter ab 8.)


let student1 = Student("student 1", "a")
let student2 = Student("student 2", "b")
let student3 = Student("student 3", "c")

var studentArray:[Student] = [student1,student2,student3]

print(student1.name)
studentArray[0].firstName = "Max mustermann "
print(student1.name)
//9.) Yes becous they are refences


//10 it can be changed becous the constant is the reverence to an object not the obect
student1.firstName=" new name"//works
//student1 =student2// dont work becouse the reverence is constant

print(student1.name)



//: ### Protocols and extensions
//: 1. Create a protocol called `NamedThing`. Add a `get` variable of type `String`, with the name `name`.
//: 1. Use extensions to make your `Person` class and `Pet` structs from above conform to the new protocol.
//: 1. Create a new array that contains all the objects you declared as `let` constants above. You may have to explicitly specify the type of the array as `[NamedThing]`.
//: 1. Iterate over the objects in the array and print out their names.
//: 1. Create a protocol extension for `NamedThing` that contains a new computed property of type `String` called `initial`. Add a default implementation in your protocol extension, which returns the first character of the `name` property, or, if `name` is empty, an empty string.
//: 1. Print the new `initials` property in the loop you created above.
