//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Ляль on 01.01.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    static let emojisPerson: Array<String> = ["👾", "🤡", "👺", "🌚", "🌞", "👹", "💩", "🐒", "🐥", "🐁", "🌜", "🐀", "🌛", "👮🏻‍♂️", "🕵🏻‍♂️", "💂🏻‍♂️", "👨🏻‍✈️", "🥷🏻"]
    static let emojisVehicles: Array<String> = ["🚗", "🚕", "🚎", "🚒", "🏎", "🚚", "🚛", "🚤", "🚑", "🚌", "🏍", "🚀", "🛶", "🛺", "🚃", "🚓", "🚲", "⛵️"]
    static let emojisAnimals: Array<String> = ["🦀", "🦩", "🐎", "🐓", "🐛", "🦥", "🦦", "🦔", "🦧", "🐋", "🦐", "🦙", "🐀", "🦒", "🦍", "🦓", "🐙", "🦭 "]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 12) {pairIndex in
            emojisPerson[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card) 
    }
}
    
