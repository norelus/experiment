//
//  BottomSheetView.swift
//  Experiment
//
//  Created by Aurélien Caille on 07/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI


struct BottomSheetScrollOffsetKey: PreferenceKey {
    
    typealias Value = CGFloat
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
    
}

struct BottomSheetView<Content>: View where Content:View {
    
    


    
    @Binding var isShow: Bool
    
    var content: () -> Content
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }

        var isDragging: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }

    }
    
    enum ViewState {
        case full
        case half
    }
    
    
    @GestureState private var dragState = DragState.inactive
    @State private var positionOffset: CGFloat = 0.0
    @State private var scrollOffset: CGFloat = 0.0
    @State private var viewState: ViewState = .half
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack() {
                Spacer()
                HandleBar()
                ScrollView(.vertical) {
                    GeometryReader { scrollViewProxy in
                        Color.clear.preference(
                            key: BottomSheetScrollOffsetKey.self,
                            value: scrollViewProxy.frame(in: .named("scrollview")).minY)
                    }
                    .frame(height: 0)
                    content()
                    .offset(y: -self.scrollOffset)
                    .animation(nil)
                }
                .background(Color("cardBackground"))
                .cornerRadius(10, antialiased: true)
                .disabled(self.viewState == .half)
                .coordinateSpace(name: "scrollview")
            }
            .offset(y: geometry.size.height / 2 + self.dragState.translation.height + self.positionOffset)
            .offset(y: self.scrollOffset)
            .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 8.0))
            .edgesIgnoringSafeArea(.bottom)
            .gesture(DragGesture()
                        .updating(self.$dragState, body: {
                            value, state, transaction in
                            state = .dragging(translation: value.translation)
                        })
                        .onEnded{value in
                            if self.viewState == .half {
                                let highThreshold = geometry.size.height * 0.25
                                if value.translation.height < -highThreshold {
                                    self.positionOffset = -geometry.size.height/2 + 50
                                    self.viewState = .full
                                }
                            }
                            let lowThreshold = geometry.size.height * 0.3
                            if value.translation.height > lowThreshold {
                                self.isShow = false
                            }
                            
                        })
            .onPreferenceChange(BottomSheetScrollOffsetKey.self) { value in
                print("scrolloffset = \(value)")
                if self.viewState == .full {
                    self.scrollOffset = value > 0 ? value : 0
                    if self.scrollOffset > 40 {
                        self.positionOffset = 0
                        self.viewState = .half
                        self.scrollOffset = 0
                    }
                }
            }
        }
    }
    
    struct HandleBar: View {

        var body: some View {
            Rectangle()
                .frame(width: 50, height: 5)
                .foregroundColor(Color(.systemGray5))
                .cornerRadius(10)
        }
    }

    
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isShow: .constant(true)) {
            Text("toto")
        }
    }
}
