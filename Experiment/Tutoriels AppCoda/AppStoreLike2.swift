//
//  TestFullScreenAnim.swift
//  Experiment
//
//  Created by Aurélien Caille on 12/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

extension Animation {
    
    static let myWeirdSpring = Animation.interactiveSpring(response: 0.50, dampingFraction: 0.75, blendDuration: 0.1)
    
}

struct AppStoreLike2: View {
    
    @Namespace var animation
    
    @Binding var isPresented: Bool
    
    @State private var showContents: [Bool] = Array(repeating: false, count: sampleArticles.count)
    @State private var lastShown = 0
    
    enum ContentMode {
        case list
        case content
    }
    
    private var contentMode: ContentMode {
        self.showContents.contains(true) ? .content : .list
    }
    
    //first index where show contents is true :)
    private var selectedArticleIndex: Int? {
        return self.showContents
            .enumerated()
            .first(where: { $0.element })?
            .offset
    }
    
    var body: some View {
        GeometryReader { fullView in
            ZStack {
                cardList
                    .frame(width: fullView.size.width)
                    .disabled(contentMode == .content)
                if let index = selectedArticleIndex {
                    let article = sampleArticles[index]
                    FullScreenArticleView(article: article, isPresented: $showContents[index])
                        .matchedGeometryEffect(id: "card\(index)", in: animation)
                        .onTapGesture {
                            self.showContents[index] = false
                        }
                        .animation(.myWeirdSpring)
                        .ignoresSafeArea()
                }
            }
            .background(Color(.systemBackground).ignoresSafeArea())
        }
        .navigationBarHidden(true)
    }
    
    var cardList: some View {
        ScrollView {
            VStack(spacing: 40) {
                AppStoreTopBar(onBackPressed: {
                    print("tap back")
                    withAnimation {
                        isPresented = false
                    }
                })
                .padding(.horizontal,20)
                .opacity(contentMode == .list ? 1 : 0.3)
                .animation(.linear)
                ForEach(sampleArticles.indices) { index in
                    let article = sampleArticles[index]
                    CardView(cornered: true) {
                        GeometryReader { cardView in
                            ArticleView(geometry: cardView,
                                        article: article,
                                        isFullScreen: $showContents[index])
                        }
                    }
                    .matchedGeometryEffect(id: "card\(index)", in: animation)
                    .frame(height: 400)
                    .onTapGesture {
                        self.showContents[index] = true
                        self.lastShown = index
                    }
                    .animation(.myWeirdSpring)
                    .opacity((contentMode == .list || showContents[index]) ? 1 : 0.3)
                    .animation(.linear)
                    .zIndex(lastShown == index ? 1 : 0)
                    
                }
                
            }.padding(.horizontal)
        }
    }
    
}

struct FullScreenArticleView : View {
    
    var article: Article
    
    @Binding var isPresented: Bool
    
    var body: some View {
        
        CardView(cornered: false) {
            GeometryReader { cardView in
                ScrollView(.vertical) {
                    ArticleView(geometry: cardView,
                                article: article,
                                isFullScreen: $isPresented)
                }
            }
        }
        .zIndex(1)
    }
    
}


struct TestFullScreenAnim_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreLike2(isPresented: .constant(true)).environment(\.colorScheme, .light)
    }
}
