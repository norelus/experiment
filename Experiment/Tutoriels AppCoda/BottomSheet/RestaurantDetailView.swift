//
//  RestaurantDetailView.swift
//  Experiment
//
//  Created by Aurélien Caille on 05/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    /*
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
    
    struct ScrollOffsetKey: PreferenceKey {
        
        typealias Value = CGFloat
        static var defaultValue: CGFloat = .zero
        
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value += nextValue()
        }
        
    }
    
    @GestureState private var dragState = DragState.inactive
    @State private var positionOffset: CGFloat = 0.0
    @State private var scrollOffset: CGFloat = 0.0
    @State private var viewState: ViewState = .half
    
    @Binding var isShow: Bool
    
    var restaurant: Restaurant
    
    var body: some View {
        GeometryReader { geometry in
            VStack() {
                Spacer()
                HandleBar()
                ScrollView(.vertical) {
                    GeometryReader { scrollViewProxy in
                        Color.clear.preference(
                            key: ScrollOffsetKey.self,
                            value: scrollViewProxy.frame(in: .named("scrollview")).minY)
                    }
                    .frame(height: 0)
                    VStack {
                        titleBar
                        header
                        infos
                    }
                    .offset(y: -self.scrollOffset)
                    .animation(nil)
                }
                .background(Color.white)
                .cornerRadius(10, antialiased: true)
                .disabled(self.viewState == .half)
                .coordinateSpace(name: "scrollview")
            }
            .offset(y: geometry.size.height / 2 + self.dragState.translation.height + self.positionOffset)
            .offset(y: self.scrollOffset)
            .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 8.0))
            .edgesIgnoringSafeArea(.all)
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
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                print("\(value)")
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
    */
    
    var restaurant: Restaurant
    
    
    var body: some View {
        VStack {
            titleBar
            header
            infos
        }
    }
    
    var titleBar: some View {
        HStack {
            Text("Restaurant Details")
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
            Spacer()
        }
    }
    
    var header: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
                .overlay(imageOverlay)
        }
    }
    
    var imageOverlay: some View {
        VStack() {
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text(restaurant.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text(restaurant.type)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(Color.red)
                }.padding()
                Spacer()
            }
        }
    }
    
    var infos: some View {
        VStack(alignment: .leading) {
            DetailInfoView(icon: "map", info: restaurant.location)
                .padding(.top)
            DetailInfoView(icon: "phone", info: restaurant.phone)
            DetailInfoView(icon: nil, info: restaurant.description)
                .padding(.top)
                .padding(.bottom, 100)
            
        }
    }
    
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let firstRestaurant = restaurants.first
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            RestaurantDetailView(restaurant: firstRestaurant! )
        }
    }
}

struct DetailInfoView: View {
    
    let icon: String?
    let info: String
    
    var body: some View {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            
            Spacer()
        }
        .padding(.horizontal)
        
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