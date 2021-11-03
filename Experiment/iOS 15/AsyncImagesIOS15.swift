//
//  ListsIOS15.swift
//  Experiment
//
//  Created by Aurélien Caille on 21/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AsyncImagesIOS15: View {
    
    struct Item: Identifiable {
        let id: Int
        let imageId: Int
        let url: String
    }
    
    @State var items: [Item] = []
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                ForEach(items){item in
                    AsyncImage(
                        url: URL(string: item.url)!,
                        transaction: .init(animation: .spring())
                    ) { phase in
                        switch phase {
                        case .empty:
                            Color("accent")
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .transition(.opacity.combined(with: .scale))
                        case .failure(_):
                            Text("Error loading image with id \(item.imageId)")
                        @unknown default:
                            Text("Unknown error")
                        }
                    }
                        .frame(width: 150, height: 100)
                        .mask(RoundedRectangle(cornerRadius: 8))
                }
            }.refreshable { //doesn't work but maybe later
                await self.refreshImages()
            }.task { //launches at display link to the lifetime of the view
                await self.refreshImages()
            }
        }.navigationTitle("Async Images")
    }
    
    func refreshImages() async {
        items = (0...50).map {
            let randomId = Int(arc4random() % 1000)
            let url = "https://picsum.photos/id/\(randomId)/150/100"
            return Item(id: $0, imageId:randomId, url: url)
        }
    }
}

struct AsyncImagesIOS15_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImagesIOS15()
    }
}
