import UIKit

var greeting = "Hello, playground"


var optinalNum: Int?
optinalNum = 33

// [Optional Conditional]
if let checkNum = optinalNum {
	print("good \(optinalNum)")
} else  {
	print(" found \(optinalNum)")
}

// GUARD -> provides an early exit out of function if Nil
func tripleNum (number: Int?) -> Int {
	guard let number = number else {
		print("Exiting function")
		return -1
	}
	print("tripled # \(number * 3)")
	return number * 3
}

let result = tripleNum(number: optinalNum)
print("func result: \(result)")


// [Optional Chaining]

struct Device {
	var type: String
	var price: Float
	var color: String
}

var myPhone: Device?
let devicePrice = myPhone?.price
print(myPhone)
print(devicePrice)

