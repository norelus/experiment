//
//  ExpandableBottomSheetView.swift
//  Experiment
//
//  Created by Aurélien Caille on 05/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ContextSwipeBottomsheet: View {
    
    @State private var myRestos = restaurants
    @State private var showDetail = false
    @State private var selectedRestaurant: Restaurant?
    
    
    var body: some View {

        ZStack {
            list
                .offset(y: showDetail ? -100 : 0)
                .animation(.easeOut(duration: 0.2))
            
            if showDetail {
                Overlay()
                    .onTapGesture {
                        self.showDetail = false
                    }
                     
                if let selectedRestaurant = selectedRestaurant {
                    BottomSheetView(isShow: $showDetail) {
                        RestaurantDetailView(restaurant: selectedRestaurant)
                    }
                    .transition(.move(edge: .bottom))
                }
            }
        }.navigationBarTitle("Restaurants", displayMode: .inline)
    }
    
    var list: some View {
        List {
            ForEach(myRestos) { restaurant in
                BasicImageRow(restaurant: restaurant)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemBackground))
                    .onTapGesture {
                        self.showDetail = true
                        self.selectedRestaurant = restaurant
                    }
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            self.delete(item: restaurant)
                        }) {
                            Label(
                                title: { Text("Delete") },
                                icon: { Image(systemName: "trash") })
                        }
                        Button(action: {
                            self.setFavorite(item: restaurant)
                        }) {
                            Label(
                                title: { Text("Favorite") },
                                icon: { Image(systemName: "star") })
                        }
                    }))
            }.onDelete{ indexSet in
                self.myRestos.remove(atOffsets: indexSet)
            }
        }
    }
    
    
    private func delete(item restaurant: Restaurant) {
        if let index = self.myRestos.firstIndex(where: {
            $0.id == restaurant.id
        }) {
            self.myRestos.remove(at: index)
        }
    }
    
    private func setFavorite(item restaurant: Restaurant) {
        if let index = self.myRestos.firstIndex(where: {
            $0.id == restaurant.id
        }) {
            self.myRestos[index].isFavorite.toggle()
        }
    }
    
}

struct ContextSwipeBottomsheet_Previews: PreviewProvider {
    static var previews: some View {
        ContextSwipeBottomsheet()
    }
}


struct BasicImageRow: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
            Spacer()
            if restaurant.isFavorite {
                Image.init(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct Overlay : View {

    var bgColor: Color = .black

    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .opacity(0.5)
        .edgesIgnoringSafeArea(.all)
    }
}
