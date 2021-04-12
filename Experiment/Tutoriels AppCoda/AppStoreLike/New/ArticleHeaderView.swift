//
//  ArticleHeaderView.swift
//  Experiment
//
//  Created by Aurélien Caille on 11/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ArticleHeaderView: View {
    
    @Namespace private var animation
    
    let category: String
    let headline: String
    let subHeadline: String
    let image: UIImage
    
    let geometry: GeometryProxy
    
    @Binding var isShowContent: Bool
    
    var body: some View {
        ZStack {
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .border(Color.gray.opacity(0.1))
                .frame(width: geometry.size.width,
                       height: min(image.size.height/3, 500))
                .clipped()
                .matchedGeometryEffect(id: "image", in: animation)
            VStack {
                Spacer()
                ArticleTitleView(category: category,
                                 headline: headline,
                                 subHeadline: isShowContent ? nil : subHeadline)
            }
        }
    }
}

struct ArticleHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack {
                        ArticleHeaderView(category: sampleArticles[0].category,
                                          headline: sampleArticles[0].headline,
                                          subHeadline: sampleArticles[0].subHeadline,
                                          image: sampleArticles[0].image,
                                          geometry: geometry,
                                          isShowContent: .constant(false))
                        Text("toto toto toto toto toto toto toto toto toto toto toto toto toto toto toto toto toto toto toto ")
                    }
                }
            }
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack {
                        ArticleHeaderView(category: sampleArticles[5].category,
                                          headline: sampleArticles[5].headline,
                                          subHeadline: sampleArticles[5].subHeadline,
                                          image: sampleArticles[5].image,
                                          geometry: geometry,
                                          isShowContent: .constant(false))
                        Text("toto toto toto toto toto toto toto toto toto toto toto toto toto toto toto toto toto toto toto ")
                    }
                }
            }
        }
    }
}

