//
//  ArticleTitleView.swift
//  Experiment
//
//  Created by Aurélien Caille on 11/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ArticleTitleView: View {
    
    let category: String
    let headline: String
    let subHeadline: String?
    
    var body: some View {
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
                
                if let subHeadline = subHeadline {
                    Text(subHeadline)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .minimumScaleFactor(0.1)
                        .lineLimit(3)
                }
                
            }
            .padding()
            Spacer()
        }
        .background(Color(.systemBackground))
        .frame(maxWidth: .infinity)
    }
}

struct ArticleTitleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = sampleArticles[5]
        ArticleTitleView(category: article.category, headline: article.headline, subHeadline: article.subHeadline)
    }
}
