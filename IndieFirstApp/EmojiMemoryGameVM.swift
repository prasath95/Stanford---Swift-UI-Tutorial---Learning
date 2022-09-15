//
//  EmojiMemoryGameVM.swift
//  IndieFirstApp
//
//  Created by Prasath Sivanathan on 2022-09-11.
//

import SwiftUI

class EmojiMemoryGameVM : ObservableObject{
    
    static let emojis=["❤️1","❤️2","2","✅3","4✅","🌱2","🌱1"]
    
    static func createMemoryGame()->MemoryGameModel<String>{
        MemoryGameModel<String>(numberOfCards: 3){ index in emojis[index] }
    }
    
    @Published private var emojiGameModel=createMemoryGame()
    
    var cards: Array<MemoryGameModel<String>.Card>{
        return emojiGameModel.cards
    }
    
    func chooseCard(card:MemoryGameModel<String>.Card){
        emojiGameModel.selectCard(card: card)
    }
    
    
}


