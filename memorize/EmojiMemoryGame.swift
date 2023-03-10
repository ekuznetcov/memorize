//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by ะัะปั on 01.01.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
    private static let emojisPerson: Array<String> = ["๐พ", "๐คก", "๐บ", "๐", "๐", "๐น", "๐ฉ", "๐", "๐ฅ", "๐", "๐", "๐", "๐", "๐ฎ๐ปโโ๏ธ", "๐ต๐ปโโ๏ธ", "๐๐ปโโ๏ธ", "๐จ๐ปโโ๏ธ", "๐ฅท๐ป"]
    private static let emojisVehicles: Array<String> = ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ค", "๐", "๐", "๐", "๐", "๐ถ", "๐บ", "๐", "๐", "๐ฒ", "โต๏ธ"]
    private static let emojisAnimals: Array<String> = ["๐ฆ", "๐ฆฉ", "๐", "๐", "๐", "๐ฆฅ", "๐ฆฆ", "๐ฆ", "๐ฆง", "๐", "๐ฆ", "๐ฆ", "๐", "๐ฆ", "๐ฆ", "๐ฆ", "๐", "๐ฆญ "]
    
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
    

