//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Ляль on 01.01.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
    private static let emojisPerson: Array<String> = ["👾", "🤡", "👺", "🌚", "🌞", "👹", "💩", "🐒", "🐥", "🐁", "🌜", "🐀", "🌛", "👮🏻‍♂️", "🕵🏻‍♂️", "💂🏻‍♂️", "👨🏻‍✈️", "🥷🏻"]
    private static let emojisVehicles: Array<String> = ["🚗", "🚕", "🚎", "🚒", "🏎", "🚚", "🚛", "🚤", "🚑", "🚌", "🏍", "🚀", "🛶", "🛺", "🚃", "🚓", "🚲", "⛵️"]
    private static let emojisAnimals: Array<String> = ["🦀", "🦩", "🐎", "🐓", "🐛", "🦥", "🦦", "🦔", "🦧", "🐋", "🦐", "🦙", "🐀", "🦒", "🦍", "🦓", "🐙", "🦭 "]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 15) {pairIndex in
            emojisPerson[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: Card){
        model.choose(card) 
    }
}
    

