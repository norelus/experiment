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
    
    @Binding var isPresented: Bool
    
    @Namespace var animation
    @State private var showContents: [Bool] = Array(repeating: false, count: sampleArticles.count)
    @State private var lastShown = 0
    
    enum ContentMode {
        case list
        case content
    }
    
    private var contentMode: ContentMode {
        self.showContents.contains(true) ? .content : .list
    }
    
    private var selectedArticleIndex: Int? {
        return self.showContents.enumerated()
            .filter { iterator in
                iterator.element
            } . map { $0.offset }.first
    }
    //let animation: Namespace.ID
    
    var body: some View {
        GeometryReader { fullView in
            ZStack {
                ScrollView {
                    VStack(spacing: 40) {
                        AppStoreTopBar(onBackPressed: {
                            isPresented = false
                        })
                            .padding(.horizontal,20)
                            .opacity(contentMode == .list ? 1 : 0.3)
                            .animation(.linear)
                        ForEach(sampleArticles.indices) { index in
                            let article = sampleArticles[index]
                            CardView {
                                GeometryReader { cardView in
                                    TotoContenu(geometry: cardView,
                                                article: article)
                                }
                            }
                            .matchedGeometryEffect(id: "card\(index)", in: animation)
                            .frame(height: 400)
                            .animation(.myWeirdSpring)
                            .opacity((contentMode == .list || showContents[index]) ? 1 : 0.3)
                            .animation(.linear)
                            .zIndex(lastShown == index ? 1 : 0)
                            .onTapGesture {
                                self.showContents[index] = true
                                self.lastShown = index
                            }
                        }
                    }.padding(.horizontal)
                }
                .frame(width: fullView.size.width)
                .disabled(contentMode == .content)
                
                
                if let index = selectedArticleIndex {
                    let article = sampleArticles[index]
                    CardView {
                        GeometryReader { cardView in
                            ScrollView(.vertical) {
                                TotoContenu(geometry: cardView,
                                            article: article)
                            }
                        }
                    }
                    .zIndex(1)
                    .matchedGeometryEffect(id: "card\(index)", in: animation)
                    .onTapGesture {
                        self.showContents[index] = false
                    }
                    .animation(.myWeirdSpring)
                }
            }
            .background(Color(.systemBackground).ignoresSafeArea())
            
        }.navigationBarHidden(true)
    }
    
}


struct TotoContenu: View {
    
    var geometry: GeometryProxy
    
    var article: Article
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Image(uiImage: article.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:geometry.size.width, height: 400)
                    .clipped()
                leTexte.padding()
                .frame(maxWidth: .infinity)
                .background(Color("cardBackground"))
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 400)
            Text(article.content)
                .foregroundColor(.secondary)
                .padding()
        }.background(Color("cardBackground"))
        
    }
    
    
    var leTexte: some View {
        VStack(alignment: .leading) {
            Text(article.category.uppercased())
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
            
            Text(article.headline)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .minimumScaleFactor(0.1)
                .lineLimit(2)
                .padding(.bottom, 5)
            
        }
    }
    
}

struct TestFullScreenAnim_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreLike2(isPresented: .constant(true)).environment(\.colorScheme, .light)
    }
}
