//
//  GenericImageList.swift
//  Experiment
//
//  Created by Aurélien Caille on 19/06/2025.
//  Copyright © 2025 norelus. All rights reserved.
//

import SwiftUI

public struct GenericImageList: View {
    
    
    struct Item: Identifiable {
        let id: Int
        let imageId: Int
        let url: String
    }
    
    @State var items: [Item] = (0...10).map {
        let id = 123+$0
        let url = "https://picsum.photos/id/\(id)/350/250"
        return Item(id: $0, imageId:id, url: url)
        
    }
    
    public var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 350))]) {
            ForEach(items){item in
                AsyncImage(
                    url: URL(string: item.url)!)
                .frame(width: 350, height: 250)
                .mask(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}
