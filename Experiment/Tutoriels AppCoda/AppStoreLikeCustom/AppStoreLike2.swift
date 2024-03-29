//
//  AppStoreLike3.swift
//  Experiment
//
//  Created by Aurélien Caille on 29/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AppStoreLike2: View {
        
    @Environment(\.presentationMode) var presentationMode
    @Namespace var viewAnimation
    
    var body: some View {
        let contents = sampleArticles.map { article in
            ArticleView(article: article, viewAnimation: viewAnimation)
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

struct AppStoreLike2_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreLike2()
    }
}
