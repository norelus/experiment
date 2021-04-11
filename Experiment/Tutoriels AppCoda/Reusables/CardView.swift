//
//  CardView.swift
//  Experiment
//
//  Created by Aurélien Caille on 10/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    let id = UUID()
    var trip: Trip
    
    var body: some View {
        ZStack {
            Image(trip.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth:0, maxWidth: .infinity)
                .padding(.horizontal)
                .cornerRadius(10)
                .overlay(vignette, alignment: .bottom)
        }.padding()
    }
    
    var vignette: some View {
        Text(trip.destination)
            .font(.system(.headline, design: .rounded))
            .fontWeight(.bold)
            .padding(8)
            .foregroundColor(.primary)
            .background(Color(.systemBackground))
            .cornerRadius(5)
            .padding()
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(trip: trips[5])
    }
}
