//
//  AppStoreLikeList.swift
//  Experiment
//
//  Created by Aurélien Caille on 29/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AppStoreContent: View, Identifiable {
    
    var id: Int = .random(in: 0...1_000_000)
    var title: String
    var color: Color
    
    var body: some View {
        ZStack {
            color
            Text(title).font(.largeTitle).frame(height: 250)
        }
    }
    
}

struct AppStoreLikeList<ContentView: View>: View {
    
    @Namespace var myanim
    
    var contents: [ContentView]
    
    @State var displayedIndex: Int? = nil
    @State var lastDisplayedIndex: Int = 0
    
    var body: some View {
        
        GeometryReader { fullView in
            
            ZStack {
                
                list.frame(width: fullView.size.width)
                    .disabled(displayedIndex != nil)
                if let displayed = displayedIndex {
                    CardView(cornered: false) {
                        contents[displayed]
                    }
                    .onTapGesture {
                        hideItem()
                    }
                    .matchedGeometryEffect(id: "content_\(displayed)", in: myanim)
                    .animation(.easeInOut)
                }
                
            }
        }
    }
    
    var list: some View {
        ScrollView {
            VStack {
                ForEach(contents.indices) { index in
                    if displayedIndex == index {
                        Color.clear.frame(height: 250)
                    } else {
                        CardView(cornered: true) {
                            contents[index]
                        }
                        .onTapGesture {
                            displayItemAt(index: index)
                        }
                        .matchedGeometryEffect(id: "content_\(index)", in: myanim)
                        .animation(.easeInOut)
                        .zIndex(index == lastDisplayedIndex ? 1 : 0)
                        
                    }
                }
            }
        }
    }
    
    
    func displayItemAt(index: Int) {
        //withAnimation(.easeInOut){
            displayedIndex = index
            lastDisplayedIndex = index
        //}
    }
    
    func hideItem() {
        //withAnimation(.easeInOut){
            displayedIndex = nil
        //}
    }
    
}

struct AppStoreLikeList_Previews: PreviewProvider {
    static var previews: some View {
        let green = AppStoreContent(title: "vert", color: .green)
        let red = AppStoreContent(title: "rouge", color: .red)
        let blue = AppStoreContent(title: "bleu", color: .blue)
        let grey = AppStoreContent(title: "gris", color: .gray)
        let contents = [green, red, blue, grey]
        AppStoreLikeList(contents: contents)
    }
}
