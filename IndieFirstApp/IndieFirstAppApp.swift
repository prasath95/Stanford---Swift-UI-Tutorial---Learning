//
//  IndieFirstAppApp.swift
//  IndieFirstApp
//
//  Created by Prasath Sivanathan on 2022-09-06.
//

import SwiftUI

@main
struct IndieFirstAppApp: App {
    let game=EmojiMemoryGameVM()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
