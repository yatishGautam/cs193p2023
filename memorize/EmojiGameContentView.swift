//
//  EmojiGameContentView.swift
//  memorize
//
//  Created by Yatish Gautam on 2023-08-27.
//

import SwiftUI

var foodAndDrinks = ["🍎","🍊","🥐","🍞","🥖","🧀","🥚","🍳","🍰","🍺","🍪","🍩","🍫","🍤","🍙","🌭","🦴","🍖","🍗","🌶"]
var cars = ["🚗","🚕","🚑","🚓","🏎","🚒","🚜","🚲","🏍","🚔","🚘","🛩","🚀","🚁"]
var balls = ["⚽️","🏀","🏈","🥎","🎾","🏐","🏉","🎱","🏸","🏏","⛳️","🥋","🎲","🎯","🎳"]

struct EmojiGameContentView: View {
    
    
    
    
    @State var theme: Int = 0
    @State var cardCount : Int = 4
    
    var body: some View {
        VStack {
            titleLabel
            ScrollView{
                    cards
                }
            Spacer()
            cardCountAdjuster
            Spacer()
            themeSelector
        }
        .padding()
    }
    
    var titleLabel: some View {
        Text("Memorize")
            .font(.largeTitle)
            .foregroundColor(themeColor[theme])
    }
    let themeEmojis = [foodAndDrinks, cars, balls]
    var cards: some View{
        
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                Cardview(emoji: themeEmojis[theme][index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(themeColor[theme])
    }
    
    //consolidated card count adjusters
    var cardCountAdjuster: some View {
        HStack{
            cardAdder
            Spacer()
            cardRemover
        }.font(.largeTitle)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, icon: "plus.app.fill")
    }
    var cardRemover: some View {
        cardCountAdjuster(by: -1, icon: "minus.square.fill")
    }
    //generate card counter
    func cardCountAdjuster(by offset: Int, icon: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {Image(systemName: icon)})
        .disabled((cardCount + offset < 1)||(cardCount + offset > themeEmojis[theme].count))
        .foregroundColor(themeColor[theme])
    }
    //select theme that needs to change
    var themeSelector: some View {
        HStack{
            ForEach(0...2, id: \.self){ index in
                Button(action: {
                    theme = index
                }, label: {
                    VStack{
                        Image(systemName: "\(index).circle.fill").font(.largeTitle)
                        Text("Theme \(index+1)").font(.footnote)
                    }
                })
            }
        }.foregroundColor(themeColor[theme])
    }
}




























//MARK: - card view
struct Cardview: View {
    var emoji: String
    @State var isFaceup: Bool = false
    var body: some View{
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack{
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(emoji).font(.largeTitle)
            }.opacity(isFaceup ? 1 : 0)
            base.fill().opacity(isFaceup ? 0 : 1)
        }.onTapGesture {
            isFaceup.toggle()
            print("tapped")
        }
    }
}









//MARK: - preview provider
struct EmojiGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiGameContentView()
    }
}
