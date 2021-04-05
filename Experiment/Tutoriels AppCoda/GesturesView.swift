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
    
}

struct GesturesView: View {
    
    @State var isPressed = false
    
    @GestureState var longPressTap = false
    @GestureState var dragOffsetGreen = CGSize.zero
    
    //@GestureState private var dragStateGreen: DragState = .inactive
    
    @State private var positionGreen = CGSize(width: 0, height: -150)
    
    @GestureState var dragOffsetRed = CGSize.zero
    @State private var positionRed = CGSize(width: 0, height: 150)
    
    var body: some View {
        ZStack {
            redCircle
            greenCircle
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
    
    var greenCircle: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .scaleEffect(isPressed ? 0.5 : 1.0)
            .offset(x: positionGreen.width + dragOffsetGreen.width,
                    y: positionGreen.height + dragOffsetGreen.height)
            .animation(.easeInOut)
            .opacity(longPressTap ? 0.5 : 1.0)
            .animation(nil)
            .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .updating($longPressTap, body: { (currentState, state, transaction) in
                        state = currentState
                    })
                    .onEnded({value in
                        print("long press ended")
                        isPressed = true
                    })
                    .sequenced(before: DragGesture())
                    .updating($dragOffsetGreen, body: { value, state, transaction in
                        switch value {
                        case .first(true):
                            print("Tapping")
                        case .second(true, let drag):
                            state = drag?.translation ?? .zero
                        default:
                            break;
                        }
                        
                    })
                    .onEnded({ value in
                        print("drag ended")
                        isPressed = false
                        guard case .second(true, let drag?) = value else {
                            return
                        }
                        self.positionGreen.height += drag.translation.height
                        self.positionGreen.width += drag.translation.width
                    })
            )
    }
    
}

struct GesturesView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesView()
    }
}
