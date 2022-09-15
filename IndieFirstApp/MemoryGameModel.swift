//
//  MemoryGameModel.swift
//  IndieFirstApp
//
//  Created by Prasath Sivanathan on 2022-09-11.
//

import Foundation

struct MemoryGameModel<CardContent>{
   private(set) var cards : Array<Card>
    
    mutating func selectCard(card:Card){
        //get the id of the card
        let selectedIndex=index(of:card)
        //change it from the arraylist
        cards[selectedIndex].isFlip.toggle()
        print("\(card)")
    }
    
    func index(of card:Card)->Int{
        for index in 0..<cards.count{
            if(cards[index].id==card.id){
                return index
            }
        }
        return 0
    }
    
    init(numberOfCards:Int,createCardContent:(Int)-> CardContent){
        cards=Array<Card>()
        
        for pairIndex in 0...numberOfCards {
            let content:CardContent=createCardContent(pairIndex)
            
            cards.append(Card(content: content,id:pairIndex*2))
            cards.append(Card(content: content,id: pairIndex*2+1))
            
        }
    }
     
    
    struct Card : Identifiable{
        var isSelect:Bool=true
        var isFlip:Bool=false
        var content:CardContent
        
        var id:Int
    }
    
}
