//
//  TabViewUpdates.swift
//  Experiment
//
//  Created by Aurélien Caille on 19/06/2025.
//  Copyright © 2025 norelus. All rights reserved.
//

import SwiftUI

struct TabViewUpdates: View {
    
    @State private var showSheet = false
    @Namespace private var namespace
    var body: some View {
        TabView {
            
            Tab("Pictures", systemImage: "photo", role: .none, content: {
                    ScrollView {
                        GenericImageList()
                    }
                    .navigationTitle(Text("Pictures"))
                    
                    .sheet(isPresented: $showSheet, content: {
                        ZStack(alignment: .center) {
                            
                            Color.lightPurple.ignoresSafeArea(.all)
                            VStack {
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        showSheet = false
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .frame(width: 32, height: 32)
                                    })
                                    .buttonStyle(.glass)
                                    .padding()
                                }
                                Spacer()
                                
                            }
                            Text("Sheet zoomed from button")
                        }
                            .navigationTransition(.zoom(sourceID: "myId", in: namespace))
                    })
                
            })
            
            Tab("Info", systemImage: "info.circle.fill", role: .none, content: {
                Text("Information tab")
            })
            
            Tab("Titlred", systemImage: "magnifyingglass", role: .search, content: {
                Text("Search")
            })
            .tabPlacement(.automatic)
            
        }
        .tabBarMinimizeBehavior(.onScrollDown)
        .tabViewBottomAccessory {
            Text("Tabview bottom accessory")
                .padding()
        }
        
    }
}

struct TabViewUpdates_Previews: PreviewProvider {
    
    
    static var previews: some View {
            TabViewUpdates()
        
    }
}
