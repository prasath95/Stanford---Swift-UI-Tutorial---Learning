//
//  ContentView.swift
//  IndieFirstApp
//
//  Created by Prasath Sivanathan on 2022-09-06.
//

import SwiftUI

struct ContentView: View {
//    var isSelect:Bool=true
//    var emojis=["❤️1","❤️2","2","✅3","4✅"]
//    @State var emojiCount:Int=4
    
    @ObservedObject var viewModel:EmojiMemoryGameVM
    
    var body: some View {
        
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))], content:{
                    ForEach(viewModel.cards)
                    {
                        card in Mycard(card: card)
                            .aspectRatio(2/3,contentMode: .fit)
                            .onTapGesture {
                                viewModel.chooseCard(card: card)
                            }
                    }
                })
                .foregroundColor(.indigo)
            }
               
               
//            Spacer()
//
//            HStack{
//               AddView
//               Spacer()
//               RemoveView
//            }
//            .font(.largeTitle)
//            .padding(.horizontal)
        }
        .padding(.horizontal)
        
           
    }
    
    
//        var AddView: some View{
//            Button(action: {
//                if(emojiCount<emojis.count){
//                    emojiCount += 1
//                }
//            }) {
//                Image(systemName: "plus.circle")
//            }
//        }
//
//        var RemoveView: some View{
//            Button(action: {
//                if(emojiCount>1){
//                    emojiCount -= 1
//                }
//            }) {
//                Image(systemName: "minus.circle")
//            }
//        }
    
}


struct Mycard:View{
//          var txt:String
//   @State var isSelect=false
    
    let card:MemoryGameModel<String>.Card
    
    
    var body: some View{
        ZStack{
               let shape = RoundedRectangle(cornerRadius: 19)
              
            if card.isFlip{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 4).foregroundColor(.indigo)
                Text(card.content)
                }
                else{
                    shape.fill()
                }
        }
        
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm=EmojiMemoryGameVM()
        ContentView(viewModel: vm)
    }
}
