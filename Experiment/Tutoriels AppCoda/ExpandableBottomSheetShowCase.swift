//
//  ExpandableBottomSheetView.swift
//  Experiment
//
//  Created by Aurélien Caille on 05/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ExpandableBottomSheetShowCase: View {
    
    @State private var showDetail = false
    @State private var selectedRestaurant: Restaurant?
    
    
    var body: some View {

        ZStack {
            list
                .offset(y: showDetail ? -100 : 0)
                .animation(.easeOut(duration: 0.2))
            
            if showDetail {
                
                BlankView(bgColor: .black)
                    .opacity(0.5)
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
            ForEach(restaurants) { restaurant in
                BasicImageRow(restaurant: restaurant)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemBackground))
                    .onTapGesture {
                        self.showDetail = true
                        self.selectedRestaurant = restaurant
                    }
            }
        }
    }
    
}

struct ExpandableBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableBottomSheetShowCase()
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
        }
    }
}

struct BlankView : View {

    var bgColor: Color

    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}
