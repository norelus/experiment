//
//  ResizableView.swift
//  Experiment
//
//  Created by Aurélien Caille on 05/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ResizableView<Content>: View where Content: View{
    
    @GestureState var sizeMultiplier: CGFloat = 1.0
    
    var content: () -> Content
    
    var body: some View {
        content()
            .scaleEffect(sizeMultiplier)
            .gesture(MagnificationGesture(minimumScaleDelta: 0.5)
                        .updating($sizeMultiplier, body: { value, state, transaction in
                            state = value.magnitude
                        })
            )
            .animation(.easeInOut)
    }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableView {
            Image(systemName: "cloud.fill")
                .font(.largeTitle)
                .foregroundColor(.green)
        }
    }
}
