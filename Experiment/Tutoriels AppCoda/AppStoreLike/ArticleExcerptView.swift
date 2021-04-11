//
//  ArticleExcerptView.swift
//  Experiment
//
//  Created by Aurélien Caille on 11/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ArticleExcerptView: View {
    
    
    let category: String
    
    let headline: String
    let subHeadline: String

    @Binding var isShowContent: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Rectangle()
                .frame(minHeight: 100, maxHeight: 150)
                .overlay(
                    HStack {
                        VStack(alignment: .leading) {
                            Text(self.category.uppercased())
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                            
                            Text(self.headline)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .minimumScaleFactor(0.1)
                                .lineLimit(2)
                                .padding(.bottom, 5)
                            
                            if !self.isShowContent {
                                Text(self.subHeadline)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .minimumScaleFactor(0.1)
                                    .lineLimit(3)
                            }
                            
                        }
                        .padding()
                        Spacer()
                    }
                )
        }
        .foregroundColor(.white)
    }
}

struct ArticleExcerptView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArticleExcerptView(category: sampleArticles[0].category, headline: sampleArticles[0].headline, subHeadline: sampleArticles[0].subHeadline, isShowContent: .constant(false)).previewLayout(.fixed(width: 380, height: 500))
            
            ArticleExcerptView(category: sampleArticles[0].category, headline: sampleArticles[0].headline, subHeadline: sampleArticles[0].subHeadline, isShowContent: .constant(true)).previewLayout(.fixed(width: 380, height: 500))
        }
    }
}
