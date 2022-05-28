import UIKit
import Foundation

var greeting = "Hello, playground"


// generate new array that will sum all array ints
let pairs = [[1,5], [7,9], [11,15]]
var sum = pairs.map{ (pair) in
    pair[0] + pair[1]
}

// converts strings to array int
let stringVals = ["1", "two", "3", "four "]
let intValues = stringVals.map { Int($0)}
intValues

// extract name from array of users
struct User {
    var name: String
    var age: Int
}
let users = [
    User(name: "Curly", age: 15),
    User(name: "Curly", age: 15),
    User(name: "Curly", age: 15)
]
let name = users.map{ $0.name }
print(name)


// map celsiuos dict to farenheight dicst
let tempC: [String: Double] = ["Spring" : 10, "Summer"  : 22, "fall": 30]
let tempF = tempC.map{ (season, temp ) in
    [season: temp * 9 / 5 + 32]
}
tempF

// map dict to array
let dataDict: [String: Int ] = ["Spring" : 10, "Summer"  : 22, "fall": 30]
struct Users0 {
    var name: String
    var age: Int
}

var mappedUsers = dataDict.map { Users0(name: $0, age: $1)}
print(mappedUsers)
mappedUsers



// Compact Map--> receive non optional vaalues, but transformation creates optinal values
// assign value to optionsls or use coaliscing


let stringVals2 = ["1", "two", "3", "four ", "5"]
let intValues2 = stringVals2.compactMap {Int($0)}
print(intValues2)


// flatMap -> // make two arrays into one
// removes inner arrays

let groups =  [[1,2,3,4,5,6], [3,2,1]]
let flatMapped = groups.flatMap {$0 }
print(flatMapped)

struct Employee {
    var name : String
    var id: Int
}
let employees = [
    Employee(name: "mary", id: 123000),
    Employee(name: "jack", id: 11000),
    Employee(name: "had", id: 100420),
    Employee(name: "lamb", id: 123000)
]

let salaryTotal = employees.reduce(into: 0) { $0 + $1.id }
print (salaryTotal)

var array = [123,42,242,24,24,56,4]
array = array.filter({
    return $0 % 2 == 0
    
})

var newArr = array.map({ $0 * 2 })
print(array)
print(newArr)


let results02 = array.reduce(0, { runningSum, value in
    print(runningSum)
    print(value)
    runningSum + value
})
print(results02)
