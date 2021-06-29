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

    @State private var selectedIndex: Int?
    @State private var lastShown = 0
       
    var body: some View {
        GeometryReader { fullView in
            ZStack {
                cardList
                    .frame(width: fullView.size.width)
                    .disabled(selectedIndex != nil)
                    .allowsHitTesting(selectedIndex == nil)
                if let index = selectedIndex {
                    let article = sampleArticles[index]
                    FullScreenArticleView(article: article, displayedIndex: $selectedIndex)
                        .matchedGeometryEffect(id: "cardz\(lastShown)", in: animation)
                        .onTapGesture {
                            print("tip")
                            self.hideArticle()
                        }
                        .animation(.easeInOut)
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
                AppStore2TopBar(onBackPressed: {
                    print("tap back")
                    withAnimation {
                        isPresented = false
                    }
                })
                .padding(.horizontal,20)
                .opacity((selectedIndex == nil) ? 1 : 0.3)
                .animation(.linear)
                ForEach(sampleArticles.indices) { index in
                    
                    if index == selectedIndex {
                        //empty view
                        CardView(cornered: true) {
                            Color.clear
                        }.frame(height:400)
                    } else {
                        let article = sampleArticles[index]
                        CardView(cornered: true) {
                            GeometryReader { cardView in
                                ArticleView(geometry: cardView,
                                            article: article,
                                            displayedIndex: $selectedIndex)
                            }
                        }
                        .matchedGeometryEffect(id: "cardz\(index)", in: animation)
                        .frame(height: 400)
                        .onTapGesture {
                            print("tap")
                            self.displayArticleAt(index: index)
                        }
                        .animation(.easeInOut)
                        .opacity((selectedIndex == nil || index == lastShown) ? 1 : 0.3)
                        .animation(.linear)
                        .zIndex(lastShown == index ? 1 : 0)
                    }
                }
                
            }.padding(.horizontal)
        }
    }
    
    func displayArticleAt(index: Int) {
        print("display article at index \(index)")
        self.lastShown = index
        self.selectedIndex = index
        
    }
    
    func hideArticle() {
        print("hide article, current article = \(selectedIndex)")
        self.selectedIndex = nil
    }
    
}

struct FullScreenArticleView : View {
    
    var article: Article
    
    @Binding var displayedIndex: Int?
    
    var body: some View {
        
        CardView(cornered: false) {
            GeometryReader { cardView in
                ScrollView(.vertical) {
                    ArticleView(geometry: cardView,
                                article: article,
                                displayedIndex: $displayedIndex)
                }
            }
        }
    }
    
}


struct TestFullScreenAnim_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreLike2(isPresented: .constant(true)).environment(\.colorScheme, .light)
    }
}
