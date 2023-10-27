//
//  MemorizeGame.swift
//  memorize
//
//  Created by Yatish Gautam on 2023-09-26.
//

import Foundation

struct MemorizeGame <ContentData> where ContentData: Equatable{
    
    private(set) var cards: [Card]
    var indexOfOnlyFaceUpCard: Int? {
        get {
            var faceUpCardIndices = cards.indices.filter({index in cards[index].isFaceUp})
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        }
        set {
            cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0)}
        }
    }
    
    mutating func choose(_ card:Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let possibleMatch = indexOfOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[possibleMatch].content{
                        cards[chosenIndex].isMatched = true
                        cards[possibleMatch].isMatched = true
                    }
                }else{
                    indexOfOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
            
        }
    }
    
    
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    init(numberOfPairs:Int, cardContentFactory:(Int) -> ContentData) {
        cards = []
        for i in 0..<max(2,numberOfPairs){
            cards.append(Card(content: cardContentFactory(i), id: "\(i+1)a"))
            cards.append(Card(content: cardContentFactory(i), id: "\(i+1)b"))
        }
    }
    
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible{
        var isFaceUp = false
        var isMatched = false
        let content : ContentData
        var id: String
        
        var debugDescription: String {
            return "isFaceup \(isFaceUp ? "up":"down"); \(isMatched ? "matched":"unmatched"); id:\(id); content:\(content)"
        }
        
    }
}
