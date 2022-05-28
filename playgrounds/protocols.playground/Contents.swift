import UIKit
import CoreGraphics

protocol Moveable {
    mutating func move(to point: CGPoint)
}

protocol Hashable: Equatable {
    var hasValue: Int { get }
    static func == (lhs: Self, rhs: Self) -> Bool {
        print("hashable func")
    }
}

class Car: Moveable {
    func move(to point: CGPoint) { }
    func changeOil()
}

struct Shape: Moveable {
    mutating func move(to point: CGPoint) {.. }
    func draw()
}

let prius: Car = Car()
let square: Shape = Shape()


// MARK: Extends Sequence Protocol
extension Sequence {
    func contains(_ element: Element) -> Bool  { }
}

// MARK: String Indexing
let pizza = "paulie"
let firstChr = pizza.startIndex
let offsetChrIdx = pizza.index(firstChr, offsetBy: 3) // offset IDX
let fourthChar = pizza[offsetChrIdx]


// MARK: NSAttributedString
private func updateFlipCountLabel() {
    let attributes: [NSAttributedString.Key : Any] = [
        .strokeWidth : 5.0,
       // .strokeColor : .blue
    ]
    let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
    flipCountLabel.attributedText = attributedString
}

// MARK: Closures (inline functions)

var operation : (Double) -> Double
operation = {( operand : Double ) -> Double in return -operand }


print(offsetChrIdx)
print(fourthChar)


// MARK: Clsoure: Array has map, whic takes in a function as an argument.
let primes = [2.0. 3.0, 5.0, 7.0, 11.0]
let negativePrimes = primes.map({ -$0 })
let invertedPrimes = primes.map() { 1.0/$0 }
let primeStrings = primes.map { String($0) }

