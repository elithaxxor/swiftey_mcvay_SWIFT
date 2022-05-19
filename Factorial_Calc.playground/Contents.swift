import UIKit
import Foundation

var greeting = "Hello, playground"
//
//  File.swift
//  Factorials_Recursion
//
//  Created by a-robota on 5/17/22.
//

// calculate factorials using recursion
// multiply #'s and return product of #s


import Foundation
import UIKit

// MARK: Factorial Calc, Iterative
func factorialProductIter(val: UInt) -> UInt
{
    if val < 1 {
        return val
    }
    
    print("Factorial Calc, Iterative ")
    var product: UInt = 1
    for idx in 1...val {
        product = product * idx
    }
    return product
}


func factorialProductRecurse(val: UInt) -> UInt {
        if val < 1 {
            return val
        }
        print("Factorial Calc, Recursive ")
        print(val)
    return val * factorialProductRecurse(val: val - 1)
}



var results00 = factorialProductIter(val: 3)
var results01 = factorialProductRecurse(val: 3)


print(results00)
print(results01)





// MARK: Clsoure: Array has map, whic takes in a function as an argument.
let primes = [2.0, 3.0, 5.0, 7.0, 11.0]
let negativePrimes = primes.map({ -$0 })
let invertedPrimes = primes.map() { 1.0/$0 }
let primeStrings = primes.map { String($0) }


