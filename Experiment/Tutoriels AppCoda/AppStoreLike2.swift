//
//  AppStoreLike2.swift
//  Experiment
//
//  Created by Aurélien Caille on 11/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AppStoreLike2: View {
    
    @State private var showContents: [Bool] = Array(repeating: false, count: sampleArticles.count)
    
    
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
    
    var body: some View {
        GeometryReader { geometry in
            switch self.contentMode {
            case .list:
                AppStoreScrollView(geometry: geometry, showContents: $showContents)
                    .frame(width: geometry.size.width)//pas obligé, pour corriger les bugs d'animation au lancement de la vue
            case .content:
                if let index = selectedArticleIndex {
                    let article = sampleArticles[index]
                    FullscreenArticleView(category: article.category,
                                          headline: article.headline,
                                          subHeadline: article.subHeadline,
                                          image: article.image,
                                          content: article.content,
                                          isShowContent: $showContents[index])
                }
            }
        }.navigationBarHidden(true)
    }
    
    
    
    
}

struct AppStoreScrollView: View {
    
    var geometry: GeometryProxy
    
    @Binding var showContents: [Bool]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                AppStoreTopBar()
                    .padding(.horizontal,20)
                ForEach(sampleArticles.indices) { index in
                    let article = sampleArticles[index]
                    CardView {
                        GeometryReader { cardview in
                            ArticleHeaderView(category: article.category,
                                              headline: article.headline,
                                              subHeadline: article.subHeadline,
                                              image: article.image,
                                              geometry: cardview,
                                              isShowContent: $showContents[index])
                        }
                        
                    }.onTapGesture {
                        self.showContents[index] = true
                    }
                    .padding(.horizontal)
                    .frame(height: min(article.image.size.height / 3, 500))
                    .animation(.interactiveSpring(response: 0.65, dampingFraction: 0.75, blendDuration: 0.1))
                }
            }
        }
    }
    
}



struct AppStoreLike2_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreLike2()
    }
}
