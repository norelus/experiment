//
//  AppStoreLike3.swift
//  Experiment
//
//  Created by Aurélien Caille on 29/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AppStoreLike3: View {
        
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        let contents = sampleArticles.map { article in
            NewArticleView(article: article)
        }
        AppStoreLikeList(topBar: topBar, contents: contents, cellHeight: 400)
            .navigationBarHidden(true)
        
    }
    
    var topBar: some View {
        AppStore2TopBar(onBackPressed: {
            print("tap back")
            withAnimation {
                self.presentationMode.wrappedValue.dismiss()
            }
        })
        .padding(.horizontal,20)
        
    }
    
}

struct AppStoreLike3_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreLike3()
    }
}
