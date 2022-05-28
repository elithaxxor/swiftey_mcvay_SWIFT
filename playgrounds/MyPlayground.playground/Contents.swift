import Foundation

var greeting = "Hello, playground"

let pizzaInches: Int = 10


var slices: Int = 6

var numberOfSlices: Int {
	get {
		return slices * 30
	}
	set {
		print("number of sices \(newValue)")
	}
}

numberOfSlices = 30

