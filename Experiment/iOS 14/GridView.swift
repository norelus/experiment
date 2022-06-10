//
//  GridView.swift
//  SwiftUI Combine
//
//  Created by Aurélien Caille on 11/08/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import SwiftUI

struct GridView: View {
    
    let emojis = Emojis.getAll()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(emojis, id: \.self) {
                    emoji in
                    Text(emoji).font(.system(size: 60))
                }
            }.padding()
        }.navigationTitle("LazyVGrid")
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
