//
//  AppStoreLike.swift
//  Experiment
//
//  Created by Aurélien Caille on 11/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AppStoreLike: View {
    
    @Environment(\.presentationMode) var presentationMode

    @State private var showContents: [Bool] = Array(repeating: false, count: sampleArticles.count)
    
    
    enum ContentMode {
        case list
        case content
    }
    
    private var contentMode: ContentMode {
        self.showContents.contains(true) ? .content : .list
    }
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                VStack(spacing: 40) {
                    AppStoreTopBar(onBackPressed: {
                        presentationMode.wrappedValue.dismiss()
                    })
                        .padding(.horizontal,20)
                        .opacity(self.contentMode == .content ? 0 : 1)
                    ForEach(sampleArticles.indices) { index in
                        let article = sampleArticles[index]
                        GeometryReader { inner in
                            ArticleCardView(category: article.category,
                                            headline: article.headline,
                                            subHeadline: article.subHeadline,
                                            image: article.image,
                                            content: article.content,
                                            isShowContent: $showContents[index])
                                .onTapGesture {
                                    self.showContents[index] = true
                                }
                                .padding(.horizontal, self.showContents[index] ? 0 : 20)
                                .offset(y: self.showContents[index] ? -inner.frame(in: .global).minY : 0)
                                .opacity(self.contentMode == .list ||
                                            self.contentMode == .content && self.showContents[index] ? 1 : 0)
                        }
                        .frame(height: self.showContents[index] ?
                                fullView.size.height + fullView.safeAreaInsets.top + fullView.safeAreaInsets.bottom :
                                min(article.image.size.height / 3, 500))
                        .animation(.interactiveSpring(response: 0.65, dampingFraction: 0.75, blendDuration: 0.1))
                    }
                }
                .frame(width: fullView.size.width)//pas obligé, pour corriger les bugs d'animation au lancement de la vue
                
            }.navigationBarHidden(true)
        }
    }
    
}


struct AppStoreLike_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreLike()
    }
}
