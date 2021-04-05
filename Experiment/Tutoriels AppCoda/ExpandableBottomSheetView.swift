//
//  ExpandableBottomSheetView.swift
//  Experiment
//
//  Created by Aurélien Caille on 05/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ExpandableBottomSheetView: View {
    var body: some View {
        List {
            ForEach(restaurants) { restaurant in
                BasicImageRow(restaurant: restaurant)
            }
        }
        .navigationBarTitle("Restaurants")
    }
    
}

struct ExpandableBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableBottomSheetView()
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
        }
    }
}
