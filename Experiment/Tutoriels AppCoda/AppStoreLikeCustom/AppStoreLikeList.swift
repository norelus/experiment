//
//  AppStoreLikeList.swift
//  Experiment
//
//  Created by Aurélien Caille on 29/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

extension Animation {
    
    static let mySpring = Animation.interactiveSpring(response: 0.50, dampingFraction: 0.75, blendDuration: 0.1)
    
}

struct AppStoreLikeList<TopBar: View, ContentView: View>: View {
    
    @Namespace var viewAnimation
    
    var topBar: TopBar
    var contents: [ContentView]
    var cellHeight: CGFloat
    
    @State var displayedIndex: Int? = nil
    @State var lastDisplayedIndex: Int = 0
    
    var body: some View {
        
        GeometryReader { fullView in
            
            ZStack(alignment: .top) {
                
                list.frame(width: fullView.size.width)
                    .disabled(displayedIndex != nil)
                if let displayed = displayedIndex {
                    CardView(cornered: false) {
                        contents[displayed]
                    }
                    .ignoresSafeArea()
                    .matchedGeometryEffect(id: "content_\(displayed)", in: viewAnimation)
                    .animation(.easeInOut)
                    HStack {
                        Spacer()
                        closeButton
                            .opacity((displayedIndex != nil) ? 1 : 0.3)
                            .padding(.top, 16)
                            .padding(.trailing)
                    }
                }
                
            }
        }
    }
    
    
    var list: some View {
        ScrollView {
            VStack {
                topBar
                    .opacity((displayedIndex == nil) ? 1 : 0.3)
                    .animation(.linear)

                ForEach(contents.indices) { index in
                    if displayedIndex == index {
                        Color.clear
                            .frame(height: cellHeight)
                            .padding(16)
                    } else {
                        CardView(cornered: true) {
                            contents[index].disabled(true)
                        }
                        .onTapGesture {
                            displayItemAt(index: index)
                        }
                        .opacity((displayedIndex == nil) ? 1 : 0.3)
                        .animation(.linear)
                        .matchedGeometryEffect(id: "content_\(index)", in: viewAnimation)
                        .animation(.mySpring)
                        .frame(height: cellHeight)
                        .padding(16)
                        .zIndex(index == lastDisplayedIndex ? 1 : 0)
                    }
                }
            }
        }
    }
    
    var closeButton: some View {
        Button(action: {
            hideItem()
        }) {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 26))
                .foregroundColor(Color(.systemGray5))
                .opacity(0.9)
        }
    }
    
    func displayItemAt(index: Int) {
        displayedIndex = index
        lastDisplayedIndex = index
    }
    
    func hideItem() {
        displayedIndex = nil
    }
    
}

struct AppStoreLikeList_Previews: PreviewProvider {
    static var previews: some View {
        let green = BasicAppStoreContent(title: "vert", color: .green)
        let red = BasicAppStoreContent(title: "rouge", color: .red)
        let blue = BasicAppStoreContent(title: "bleu", color: .blue)
        let grey = BasicAppStoreContent(title: "gris", color: .gray)
        let contents = [green, red, blue, grey]
        AppStoreLikeList(topBar:Text("Bonjour"), contents: contents, cellHeight: 200)
    }
}
