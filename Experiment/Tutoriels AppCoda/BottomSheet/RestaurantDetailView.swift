//
//  RestaurantDetailView.swift
//  Experiment
//
//  Created by Aurélien Caille on 05/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct RestaurantDetailView: View {
    
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

