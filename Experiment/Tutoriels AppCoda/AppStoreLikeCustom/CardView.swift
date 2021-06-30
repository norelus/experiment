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
    
    let cornered: Bool
    
    
    init(cornered: Bool = true, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.cornered = cornered
    }
    
    var body: some View {
        content
            .background(Color("cardBackground"))
            .cornerRadius(cornered ? 16 : 0)
            .contentShape(Rectangle()) //fixes a bug wih tap gesture detector xD
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


