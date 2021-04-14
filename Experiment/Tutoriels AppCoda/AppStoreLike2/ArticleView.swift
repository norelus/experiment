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
    
    var geometry: GeometryProxy
    
    var article: Article
    
    @Binding var isFullScreen: Bool
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                imageview
                titleText
            }
            .frame(maxWidth: .infinity)
            Text(article.content)
                .foregroundColor(.secondary)
                .padding()
        }.background(Color("cardBackground"))
    }
    
    var imageview: some View {
        Image(uiImage: article.image)
            .resizable()
            .scaledToFill()
            .frame(width:geometry.size.width, height: 400)
            .clipped()
    }
    
    var titleText: some View {
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
            
        }.padding()
        .frame(maxWidth: .infinity)
        .background(Color("cardBackground"))
    }
    
}
