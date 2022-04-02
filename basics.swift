//
//  ViewController.swift
//  tictactoe
//
//  Created by a-robot on 4/1/22.
//

import UIKit
import StoreKit
import UIKit 
import Foundation 

typealias Code = String 
var code: Code = ""

typealias address0 = [String: String]
var address0: Address0 = ["": ""]

// type aliase function, create 2 calls 
typealias PromoCodeValidationFunction = ((String -> (Bool))?
var validateFunction1: PromoCodeValidationFunction 
 var validateFunction2: PromoCodeValidationFunction 
                            

var address: [String: String] = ["": ""]
var address:[String: String]){

}
class Car{
    let make: String
    let color: String
    
    // setter & getter //
    init (color: String, make: String){
        self.color = color;
        self.make = make;
    }
    func drive(){
        print("vroom vroom!")
    }
}
    

class Calcs{

    // the -> flags a return specifiying Int. //
    func addTwoNumbers(a: Double, b: Double)->Double {
        return a * b
    }

    func isEven(number: Int)-> Bool{
        if number % 2 == 0 {
            return true
        };return false
    }
}

func loopPractice(loopInt: Array<Any>) {
    let numbers = [1,2,3,4,5,5]
    for x in numbers {
        let result = x * 2
        print(result)
    }
}

// [Guard Statements] //
func numberLargerThanFive(number: Int)-> Bool{
    guard number > 5 else { return false }
    return true
}

// [Datatypes](casting) //
var buttonOne: UIButton = UIButton()
var integer: Int = 12;
var string: String = "String"
var isComplete: Bool = false


// [Optionial Datatype (nil, wrapping, unwrapping)] //
var optInt: Int? = 3
var optInt2: Int? = 4

// [UNWRAP OPTIONAL]
func printIf(){
    if let value = optInt {
        if let value2 = optInt2 {
            var result = optInt + optInt
            print(result)
        }
    }
}
func printGaurd(){
    gaurd let value = optInt else { return }
    print(value)
}

// [ENUMS -- STATE MANAGMENET] //


// represents the cases
enum States: String {
    case InProgress = "1"
    case Aborted
    case Complete
    case WillStart
}

/// create var to mess with the case
let current = .InProgress.rawValue

// switch over the cases
func checkState(){
    switch current {
    case .InProgress:
        // insert code
        print("in progress")
        break
    case .Aborted:
        // insert code
        break
    case .Complete:
        // insert code
        break
    case .WillStart:
        // insert code
        break
    case .none:
        <#code#>//
        print("none")
    }
}


checkState()
var current: States?
printGaurd()
printIf()


var price: Double? = nil
price = 1.24

var bmw: Car = Car(color: "blue", make: "bmw")
var calc = Calcs()
var bignumber: Double = 2342345235
var smallnumber: Double = 3254
let sum = calc.addTwoNumbers(a: bignumber, b: smallnumber)
let isEvenR = calc.isEven(number:333)


// [PROTOOCL] --> DELEGATE AND DATASOURCE(naming conventions, nothing more) //
protocol HumanProto{
    var color: String {get set}
    func walk()
    func isHuman()-> Bool
}

class Human {
}

class Frank: Human, HumanProto{
    var skin: }
class John: Human, HumanProto{
    var skin: String
    init(skin: String){
        self.skin = skin
    }
    func walk(){
        print("John is walking.. ")
    }
    func isHuman()-> Bool {
        return false
    }
}

// [CLOSURE // LAMNDA] // (difference between regulare func and lamda)
// --> LMANDA IS ASSIGNED TO A VARIABLED, AND CAN BE EXRPESSED ACCORDINGLY
func checkSum(number: Int)-> Bool) {
    if number > 3 {
        return true
    }; return false
}
var checkLamb: ((Int) -> (Void)) = { number in if number > 3 }

var num: Int = 2
let funcResult = checkSum(number: num)
let lambdaResult = checkLamb(4)


// [STRONG VS WEAK VARS]
var str = "asdfasdfsadfkljsdflkasf"
class Child{
    weak var baloon = "str"
}
weak var joe = Child()


// [STRINGS]
func printSteve(String: steve){
    print(steve)
}
var steve: String = "Steve"
var jobs: String ="Jobs"
let fullname = "my name is \(steve) \(jobs)"
let stringLen = fullname.count

printSteve(String: steve)
print(stringLen)


