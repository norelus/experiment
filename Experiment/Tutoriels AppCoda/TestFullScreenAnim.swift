//
//  TestFullScreenAnim.swift
//  Experiment
//
//  Created by Aurélien Caille on 12/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

extension Animation {
    
    static let myWeirdSpring = Animation.interactiveSpring(response: 0.45, dampingFraction: 0.65, blendDuration: 0.1)
    
}

struct TestFullScreenAnim: View {
    
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
        ZStack {
            ScrollView {
                VStack(spacing: 40) {
                    
                    AppStoreTopBar()
                        .padding(.horizontal,20)
                    ForEach(sampleArticles.indices) { index in
                        let article = sampleArticles[index]
                        CardView {
                            //Image(uiImage: article.image).resizable()
                            GeometryReader { cardView in
                                /*ArticleHeaderView(category: article.category,
                                                  headline: article.headline,
                                                  subHeadline: article.subHeadline,
                                                  image: article.image,
                                                  geometry: cardView,
                                                  isShowContent: $showContents[index])*/
                                TotoContenu(category: article.category, headLine: article.headline, content: article.content)
                            }
                        }
                        .matchedGeometryEffect(id: "card\(index)", in: animation)
                        .frame(height: 300)
                        .animation(.myWeirdSpring)
                        .onTapGesture {
                            self.showContents[index] = true
                            self.lastShown = index
                        }
                        .zIndex(lastShown == index ? 1 : 0)
                        
                    }
                }.padding(.horizontal)
            }
            
            
            if let index = selectedArticleIndex {
                let article = sampleArticles[index]
                CardView {
                    GeometryReader { cardView in
                        ScrollView(.vertical) {
                        /*ArticleHeaderView(category: article.category,
                         headline: article.headline,
                         subHeadline: article.subHeadline,
                         image: article.image,
                         geometry: cardView,
                         isShowContent: $showContents[index])*/
                        //Image(uiImage: article.image)
                            TotoContenu(category: article.category,
                                        headLine: article.headline,
                                        content: article.content)
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
    }
    
}


struct TotoContenu: View {
    
    var category: String
    var headLine: String
    
    var content: String?
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Color.orange
                VStack(alignment: .leading) {
                    Text(category.uppercased()).foregroundColor(.white)
                    Text(headLine).font(.headline).foregroundColor(.white)
                }.padding()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            if let content = content {
                Text(content)
                    .font(.body)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
        }
        
    }
    
}

struct TestFullScreenAnim_Previews: PreviewProvider {
    static var previews: some View {
        TestFullScreenAnim()
    }
}
