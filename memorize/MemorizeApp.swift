//
//  memorizeApp.swift
//  memorize
//
//  Created by Ляль on 07.08.2022.
//

import SwiftUI

@main
struct memorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
