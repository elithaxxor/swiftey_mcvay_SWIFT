//
//  Card.swift
//  Concentration
//
//  Created by a-robota on 5/15/22.
//

import Foundation

struct Card : Hashable
{
    
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card ) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

