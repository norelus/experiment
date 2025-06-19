//
//  Webview.swift
//  Experiment
//
//  Created by Aurélien Caille on 18/06/2025.
//  Copyright © 2025 norelus. All rights reserved.
//

import SwiftUI
import WebKit

struct MyWebView: View {
    
    
    let appleUrl = URL(string: "http://www.apple.com")!
    
    @State private var page = WebPage()
    
    var body: some View {
        WebView(page)
            .ignoresSafeArea()
            .onAppear {
                page.load(URLRequest(url: appleUrl))
            }
            .navigationTitle("WebView")
    }
    
}


struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView()
    }
}
