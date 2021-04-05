//
//  GesturesView.swift
//  Experiment
//
//  Created by Aurélien Caille on 05/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

enum DragState {
    
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(translation: let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        default:
            return false
        }
    }
    
}

struct GesturesView: View {
    
    @State var isPressed = false
    

    @GestureState var dragOffsetRed = CGSize.zero
    @State private var positionRed = CGSize(width: 0, height: 200)
    
    var body: some View {
        ZStack {
            redCircle
            greenCircle
        }
    }
    
    var greenCircle: some View {
        DraggableView {
        Image(systemName: "star.circle.fill")
            .foregroundColor(.green)
            .font(.system(size: 200))
        }
    }
    
    var redCircle: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .offset(x: positionRed.width + dragOffsetRed.width,
                    y: positionRed.height + dragOffsetRed.height)
            .animation(.easeInOut)
            .foregroundColor(.red)
            .gesture(
                DragGesture()
                    .updating($dragOffsetRed, body: {value, state, transaction in
                        state = value.translation
                    })
                    .onEnded{ value in
                        self.positionRed.height += value.translation.height
                        self.positionRed.width += value.translation.width
                    }
            )
    }
    
    
}

struct GesturesView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesView()
    }
}
