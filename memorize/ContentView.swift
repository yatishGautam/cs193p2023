//
//  ContentView.swift
//  memorize
//
//  Created by Yatish Gautam on 2023-08-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Cardview(isFaceup: true)
            Cardview()
            Cardview()
            Cardview()
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct Cardview: View {
    var isFaceup: Bool = false
    var body: some View{
        if isFaceup{
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }
        }else{
            RoundedRectangle(cornerRadius: 12)
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
