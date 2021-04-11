//
//  ArticleCardView.swift
//  Experiment
//
//  Created by Aurélien Caille on 11/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ArticleCardView: View {
    
    
    
    let category: String
    let headline: String
    let subHeadline: String
    let image: UIImage
    var content: String = ""
    
    @Binding var isShowContent: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width,
                                   height: isShowContent ? geometry.size.height * 0.7 : min(self.image.size.height/3, 500))
                            .border(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                            .overlay(
                                ArticleExcerptView(category: self.category,
                                                   headline: self.headline,
                                                   subHeadline: self.subHeadline,
                                                   isShowContent: self.$isShowContent)
                                    .cornerRadius(self.isShowContent ? 0 : 15)
                            )
                        
                        //Content
                        if self.isShowContent {
                            Text(self.content)
                                .foregroundColor(.secondary)
                                .font(.system(.body, design: .rounded))
                                .padding(.horizontal)
                                .transition(.move(edge: .top))
                                .animation(.linear)
                                .padding(.bottom)
                        }
                        
                        
                        
                    }
                    
                }
                if self.isShowContent {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.isShowContent = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 26))
                                .foregroundColor(Color(.systemGray5))
                                .opacity(0.9)
                        }
                    }
                    .padding(.top, 50)
                    .padding(.trailing)
                }
            }
            .background(Color("cardBackground"))
            .shadow(radius: self.isShowContent ? 0 : 15)
        }
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArticleCardView(category: sampleArticles[1].category, headline: sampleArticles[1].headline, subHeadline: sampleArticles[1].subHeadline, image: sampleArticles[1].image, content: sampleArticles[1].content, isShowContent: .constant(false))

            ArticleCardView(category: sampleArticles[1].category, headline: sampleArticles[1].headline, subHeadline: sampleArticles[1].subHeadline, image: sampleArticles[1].image, content: sampleArticles[1].content, isShowContent: .constant(true))
        }
    }
}
