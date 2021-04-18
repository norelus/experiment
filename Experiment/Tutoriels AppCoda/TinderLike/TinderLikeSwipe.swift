//
//  TinderLikeSwipe.swift
//  Experiment
//
//  Created by Aurélien Caille on 10/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct TinderLikeSwipe: View {
    
    
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
    
    @GestureState private var dragState = DragState.inactive
    
    private let dragThreshold: CGFloat = 80.0
    
    @State var cardViews: [TripCardView] = {
        var views = [TripCardView]()
        for index in 0..<2 {
            views.append(TripCardView(trip: trips[index]))
        }
        return views
    }()
    
    @State private var lastIndex = 1
    @State private var removalTransition = AnyTransition.trailingBottom
    
    var body: some View {
        VStack {
            TopBarMenu()
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "x.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 100))
                                    .opacity(self.dragState.translation.width < -self.dragThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0)
                                
                                
                                Image(systemName: "heart.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 100))
                                    .opacity(self.dragState.translation.width > self.dragThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0)
                            }
                        
                        
                        )
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0,
                                y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.95 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double( self.dragState.translation.width / 10) : 0))
                        .animation(.interpolatingSpring(stiffness: 180, damping: 100))
                        .transition(self.removalTransition)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: { value, state, transaction in
                                        switch value {
                                        case .first(true):
                                            state = .pressing
                                        case .second(true, let drag):
                                            state = .dragging(translation: drag?.translation ?? .zero)
                                        default: break
                                        }
                                        
                                    })
                                    .onChanged({ (value) in
                                            guard case .second(true, let drag?) = value else {
                                                return
                                            }

                                            if drag.translation.width < -self.dragThreshold {
                                                self.removalTransition = .leadingBottom
                                            }

                                            if drag.translation.width > self.dragThreshold {
                                                self.removalTransition = .trailingBottom
                                            }

                                        })
                                    .onEnded({ value in
                                        guard case .second(true, let drag?) = value else {
                                            return
                                        }
                                        if drag.translation.width < -self.dragThreshold ||
                                            drag.translation.width > self.dragThreshold {
                                            self.moveCard()
                                        }
                                    })
                        )
                        
                }
            }
            Spacer(minLength: 20)
            BottomBarMenu()
        }.navigationBarTitle("Tinder Like")
    }
    
    private func isTopCard(cardView : TripCardView) -> Bool {
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }
    
    private func moveCard() {
        cardViews.removeFirst()
        
        self.lastIndex += 1
        let trip = trips[lastIndex % trips.count]
        
        let newCardView = TripCardView(trip: trip)
        cardViews.append(newCardView)
    }
}

extension AnyTransition {
    
    static var trailingBottom: AnyTransition {
        .asymmetric(insertion: .identity,
                    removal: AnyTransition.move(edge: .trailing)
                        .combined(with: .move(edge: .bottom))
        )
    }
    
    static var leadingBottom: AnyTransition {
        .asymmetric(insertion: .identity,
                    removal: AnyTransition.move(edge: .leading)
                        .combined(with: .move(edge: .bottom)))
    }
    
}

struct TopBarMenu: View {
    
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 30))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "mappin.and.ellipse")
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 30))
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.white)
    }
    
}

struct BottomBarMenu: View {
    
    var body: some View {
        
        HStack {
            Image(systemName: "xmark")
                .font(.system(size: 30))
                .foregroundColor(.black)
            Button(action: {
                //book the trip
            }) {
                Text("BOOK IT NOW")
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 35)
                    .padding(.vertical, 15)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            Image(systemName: "heart")
                .font(.system(size: 30))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        
    }
    
}

struct TinderLikeSwipe_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TinderLikeSwipe()
            TopBarMenu().previewLayout(.sizeThatFits)
            BottomBarMenu().previewLayout(.sizeThatFits)
        }
    }
}
