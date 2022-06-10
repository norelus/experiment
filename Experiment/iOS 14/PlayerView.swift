//
//  PlayerView.swift
//  SwiftUI Combine
//
//  Created by Aurélien Caille on 11/08/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!)) {
            Text("Bienvenue").font(.largeTitle).background(Color.black.opacity(0.8))
        }
        
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
