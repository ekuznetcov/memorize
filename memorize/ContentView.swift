//
//  ContentView.swift
//  memorize
//
//  Created by Ляль on 07.08.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    Text("Memorize").font(.largeTitle).foregroundColor(.white)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                        ForEach(viewModel.cards){ card in
                            CardView(card: card)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                        viewModel.choose(card)
                                }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
}

struct CardView: View{
    let card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            let shape  = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
                Text(card.content).font(.title)
            }else{
                shape.fill()
            }
        }
    }
    
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
        
    }
}
