//
//  ContentView.swift
//  IndieFirstApp
//
//  Created by Prasath Sivanathan on 2022-09-06.
//

import SwiftUI

struct ContentView: View {
    var isSelect:Bool=true
    var emojis=["❤️1","❤️2","2","✅3","4✅"]
    @State var emojiCount:Int=4
    
    var body: some View {
        
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()], content:{
                    ForEach(emojis[0..<emojiCount],
                            id: \.self,
                            content:{
                        emoji in Mycard(txt: emoji)
                        .aspectRatio(2/3,contentMode: .fit)
                                    })
                })
                .foregroundColor(.indigo)
            }
               
               
            Spacer()
    
            HStack{
               AddView
               Spacer()
               RemoveView
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
           
    }
    
    
        var AddView: some View{
            Button(action: {
                if(emojiCount<emojis.count){
                    emojiCount += 1
                }
            }) {
                Image(systemName: "plus.circle")
            }
        }
    
        var RemoveView: some View{
            Button(action: {
                if(emojiCount>1){
                    emojiCount -= 1
                }
            }) {
                Image(systemName: "minus.circle")
            }
        }
    
}


struct Mycard:View{
          var txt:String
   @State var isSelect=false
    
    var body: some View{
        ZStack{
               let shape = RoundedRectangle(cornerRadius: 19)
              
                if isSelect{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 4).foregroundColor(.indigo)
                    Text(txt)
                }
                else{
                    shape.fill()
                }
        }
        .onTapGesture {
                isSelect = !isSelect
            }
        
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
