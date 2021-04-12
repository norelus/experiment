//
//  CardView.swift
//  Experiment
//
//  Created by Aurélien Caille on 11/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct CardView<Content: View>: View {

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .background(Color("cardBackground"))
            .cornerRadius(16)
            .frame(maxWidth: .infinity)
            .shadow(radius: 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView {
            GeometryReader { cardview in
                Text("toto").padding()
            }
        }
    }
}


