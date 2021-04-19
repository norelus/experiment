//
//  MainMenuCell.swift
//  SwiftUI Combine
//
//  Created by occmobility on 17/02/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import SwiftUI

struct MainMenuRow <Destination: View> : View {
    var title : String
    var destination : Destination
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
        }.background(Color.clear)
    }
}

struct MainMenuRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.orange
            List{
                MainMenuRow(title: "Preview", destination: ContentView())
                MainMenuRow(title: "Preview", destination: ContentView())
                MainMenuRow(title: "Preview", destination: ContentView())
                MainMenuRow(title: "Preview", destination: ContentView())
                    .listRowBackground(Color.clear)
            }.listRowBackground(Color.clear)
            .background(Color.clear)
        }
    }
}
