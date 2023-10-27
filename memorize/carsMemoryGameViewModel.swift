//
//  MemorizeViewModel.swift
//  memorize
//
//  Created by Yatish Gautam on 2023-09-26.
//

import Foundation

class carsMemoryGameViewModel: ObservableObject {
    private static let emojis = ["🚗","🚕","🚑","🚓","🏎","🚒","🚜","🚲","🏍","🚔","🚘","🛩","🚀","🚁"]
    
    @Published private var Model = createModel()
    
    private static func createModel() -> MemorizeGame<String>{
        return MemorizeGame(numberOfPairs: 7){ index in
            if emojis.indices.contains(index){
                return emojis[index]
            }else{
                return "👎🏻"
            }
        }
    }
    
    var cards :Array<MemorizeGame<String>.Card> {
        return Model.cards
    }
    
    func shuffle() {
        Model.shuffle()
    }
    
    func choose(_ card: MemorizeGame<String>.Card){
        Model.choose(card)
    }
    
    
}
