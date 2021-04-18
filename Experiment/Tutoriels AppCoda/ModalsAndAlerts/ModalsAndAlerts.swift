//
//  ModalsAndAlerts.swift
//  Experiment
//
//  Created by Aurélien Caille on 18/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ModalsAndAlerts: View {
    
    @State var showDetailView = false
    @State var selectedArticle: ArticleForModal?
    
    
    var body: some View {
        List(modalArticles) { article in
            ArticleRow(article: article)
                .onTapGesture {
                    self.showDetailView = true
                    self.selectedArticle = article
                }
        }
        .sheet(item: self.$selectedArticle) { article in
            ArticleForModalDetailView(article: article)
        }
        .navigationBarTitle("Your Reading")
    }
}


struct ArticleRow: View {
    var article: ArticleForModal
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Text(article.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("By \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
                
            HStack(spacing: 3) {
                ForEach(1...(article.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
                
                
            }
            
            Text(article.excerpt)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
    }
}


struct ModalsAndAlerts_Previews: PreviewProvider {
    static var previews: some View {
        ModalsAndAlerts()
    }
}
