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
            NavigationView {
                ScrollView {
                    GenericImageList()
                }
                .navigationTitle(Text("Pictures"))
                .toolbar {
                    ToolbarSpacer(.flexible, placement: .topBarTrailing)
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            showSheet = true
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                    .matchedTransitionSource(id: "myId", in: namespace)
                    
                }
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
            }
                .tabItem {
                    Label("Pictures", systemImage: "photo")
                }
            
            Text("Information tab")
                .tabItem {
                    Label("Info", systemImage: "info.circle.fill")
                }
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
