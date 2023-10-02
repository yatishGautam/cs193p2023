//
//  EmojiGameContentView.swift
//  memorize
//
//  Created by Yatish Gautam on 2023-08-27.
//

import SwiftUI

//var foodAndDrinks = ["🍎","🍊","🥐","🍞","🥖","🧀","🥚","🍳","🍰","🍺","🍪","🍩","🍫","🍤","🍙","🌭","🦴","🍖","🍗","🌶"]
//var cars = ["🚗","🚕","🚑","🚓","🏎","🚒","🚜","🚲","🏍","🚔","🚘","🛩","🚀","🚁"]
//var balls = ["⚽️","🏀","🏈","🥎","🎾","🏐","🏉","🎱","🏸","🏏","⛳️","🥋","🎲","🎯","🎳"]

struct EmojiGameContentView: View {
    
    @ObservedObject var viewModel: carsMemoryGame = carsMemoryGame()
    
    var body: some View {
        VStack {
            titleLabel
            ScrollView{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
    
    var titleLabel: some View {
        Text("Memorize")
            .font(.largeTitle)
    }
    
    var cards: some View{
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards.indices, id: \.self){ index in
                Cardview(card: viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
    }
    
}





//MARK: - card view
struct Cardview: View {
    let card: MemorizeGame<String>.Card
    init(card: MemorizeGame<String>.Card) {
        self.card = card
    }
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack{
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}









//MARK: - preview provider
struct EmojiGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiGameContentView()
    }
}
