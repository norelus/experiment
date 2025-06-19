//
//  TabViewUpdates.swift
//  Experiment
//
//  Created by Aurélien Caille on 19/06/2025.
//  Copyright © 2025 norelus. All rights reserved.
//

import SwiftUI

struct TabViewUpdates: View {
    var body: some View {
        TabView {
            GenericImageList()
                .tabItem {
                    Label("First", systemImage: "circle.fill")
                }
            
            Text("Second tab")
                .tabItem {
                    Label("Second", systemImage: "square.fill")
                }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
        .tabViewBottomAccessory {
            Text("Tabview bottom accessory")
                .padding()
                .glassEffect()
                .padding()
        }
    }
}
