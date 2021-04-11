//
//  FullscreenArticleView.swift
//  Experiment
//
//  Created by Aurélien Caille on 11/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct FullscreenArticleView: View {
    
    let category: String
    let headline: String
    let subHeadline: String
    let image: UIImage
    let content: String
    
    @Binding var isShowContent: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ZStack(alignment: .topTrailing) {
                        ArticleHeaderView(category: category,
                                          headline: headline,
                                          subHeadline: subHeadline,
                                          image: image,
                                          geometry: geometry,
                                          isShowContent:$isShowContent)
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                self.isShowContent = false
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 26))
                                    .foregroundColor(Color(.gray))
                                    .opacity(0.9)
                            }
                        }
                        .padding(.top, 50)
                        .padding(.trailing)
                    }
                    Text(content)
                        .foregroundColor(.secondary)
                        .font(.system(.body, design: .rounded))
                        .padding(.horizontal)
                        .transition(.move(edge: .top))
                        .animation(.linear)
                        .padding(.bottom)
                    
                }
            }.ignoresSafeArea()
        }
    }
}

struct FullscreenArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = sampleArticles[5]
        FullscreenArticleView(category: article.category,
                              headline: article.headline,
                              subHeadline: article.subHeadline,
                              image: article.image,
                              content: article.content,
                              isShowContent: .constant(true))
    }
}
