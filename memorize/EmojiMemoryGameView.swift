//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by Ляль on 07.08.2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            if card.isMatched && !card.isFaceUp{
                Rectangle().opacity(0)
            }else{
                CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
            }
        })
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
}

struct CardView: View{
    let card: EmojiMemoryGame.Card
    
    var body: some View{
        GeometryReader { geometry in
            ZStack{
                let shape  = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 250)).padding(5).opacity(0.55)
                    Text(card.content).font(font(in: geometry.size))
                }else{
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    private struct DrawingConstants{
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 5
        static let fontScale: CGFloat = 0.7
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.light)
//            .previewInterfaceOrientation(.portrait)
        
    }
}
