//
//  ArticleView.swift
//  Experiment
//
//  Created by Aurélien Caille on 14/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import Foundation
import SwiftUI

struct ArticleView: View {
    
    //var geometry: GeometryProxy
    
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack {
                header.frame(height: 400)
                Text(article.content)
                    .foregroundColor(.secondary)
                    .padding()
            }.background(Color("cardBackground"))
        }
    }
    
    var header: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                Image(uiImage: article.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:geometry.size.width, height: 400)
                    .clipped()
                titleText
            }
            .frame(width:geometry.size.width, height: 400)
            .frame(maxWidth: .infinity)
        }
    }
    
    var titleText: some View {
        HStack {
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
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("cardBackground"))
    }
    
    var closeButton: some View {
        Button(action: {
            
        }) {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 26))
                .foregroundColor(Color(.systemGray5))
                .opacity(0.9)
        }.padding(.top, 50)
        .padding(.trailing)
    }
    
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView {
                ArticleView(article: sampleArticles[0])
            }.padding(32)
        }
    }
}
