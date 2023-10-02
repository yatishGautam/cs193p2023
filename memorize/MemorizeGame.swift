//
//  MemorizeGame.swift
//  memorize
//
//  Created by Yatish Gautam on 2023-09-26.
//

import Foundation

struct MemorizeGame <ContentData> where ContentData: Equatable{
    
    private(set) var cards: [Card]
    
    func choose(_:Card){
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    init(numberOfPairs:Int, cardContentFactory:(Int) -> ContentData) {
        cards = []
        for i in 0..<max(2,numberOfPairs){
            cards.append(Card(content: cardContentFactory(i)))
            cards.append(Card(content: cardContentFactory(i)))
        }
    }
    
    struct Card : Equatable{
        
        static func == (lhs: MemorizeGame<ContentData>.Card, rhs: MemorizeGame<ContentData>.Card) -> Bool {
            return lhs.content == rhs.content &&
            lhs.isFaceUp == rhs.isFaceUp &&
            lhs.isMatched == rhs.isMatched
        }
        
        var isFaceUp = true
        var isMatched = false
        let content : ContentData
    }
}
