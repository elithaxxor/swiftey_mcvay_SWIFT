//
//  Concentration.swift
//  Concentration
//
//  Created by a-robota on 5/15/22.
//

import Foundation

class Concentration {

    private(set) var cards = [Card]()
    var indexFaceUpCard: Int? {
        get {
            
            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp } // returns true if card is faceup
            
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexFaceUpCard, matchIndex != index {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            cards[index].isFaceUp = true
            indexFaceUpCard = nil
        } else {
            for flipDown in cards.indices {
                cards[flipDown].isFaceUp = true
                indexFaceUpCard = index
            }
        }
    }
    // MARK: handle shuffle
    func shuffle(card: [Card]) -> [Card] {
        print("shuffling cards")
        //return card.shuffle()
        return card
    }
    
    init (numberOfPairCards: Int){
        for identifier in 1...numberOfPairCards {
            var card = Card()
            cards += [card, card]
            print("Identefier Created \(identifier)")
            print(card)
            var shuffledCards = shuffle(card: cards)
            print(shuffledCards)
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : "" as! Self.Element
        
    }
}
