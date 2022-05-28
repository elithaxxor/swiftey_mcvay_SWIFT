//
//  Extensions.swift
//  ImageFetcher
//
//  Created by a-robota on 5/22/22.
//

import Foundation


//MARK: Navcon extension : UIViewController



// MARK: Extensions for random Int and Double
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


extension Double {
    var arc4random: Double {
        if self > 0 {
            return Double(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Double(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

       





// MARK: Random Int / CGFloat / Double extensions
//extension CGFloat {
//    var arc4random: CGFloat {
//        if self > 0 {
//            return CGFloat(arc4random_uniform(UInt32(self)))
//        } else if self < 0 {
//            return -CGFloat(arc4random_uniform(UInt32(abs(self))))
//        } else {
//            return 0
//        }
//    }
//}
