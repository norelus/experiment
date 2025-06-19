//
//  ToolbarItems.swift
//  Experiment
//
//  Created by Aurélien Caille on 18/06/2025.
//  Copyright © 2025 norelus. All rights reserved.
//

import SwiftUI


struct ToolbarItemsView: View {
    
    @Namespace var namespace
    @State private var isButtonsExpanded: Bool = false
    @State private var isBadgesExpanded: Bool = false
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView() {
                Text("Toolbar items and bottom buttons with liquid glass effect and morph")
                NavigationLink(destination: SecondaryView(),
                               label: {
                    Text("Show secondary view")
                })
                .buttonStyle(.borderedProminent)
                GenericImageList()
            }
            .safeAreaInset(edge: .bottom) {
                HStack(alignment: .bottom) {
                    Spacer()
                    GlassEffectContainer(spacing: 4, content: {
                        HStack(alignment: .bottom) {
                            
                            Image(systemName: "paintbrush")
                                .font(.system(size: 28))
                                .frame(width: 64, height: 64)
                                .glassEffect(.regular.interactive())
                                .glassEffectUnion(id: 1, namespace: namespace)
                            if isButtonsExpanded {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 28))
                                    .frame(width: 64, height: 64)
                                    .glassEffect(.regular.interactive())
                                    .glassEffectUnion(id: 1, namespace: namespace)
                            }
                            Image(systemName: "eraser.fill")
                                .font(.system(size: 28))
                                .frame(width: 64, height: 64)
                                .glassEffect(.regular.interactive())
                                .offset(x: -10)
                        }
                        
                    })
                    
                    GlassEffectContainer(spacing: 8, content: {
                        
                        Button(action: {
                            withAnimation {
                                isButtonsExpanded.toggle()
                            }
                        }, label: {
                            Image(systemName: isButtonsExpanded ? "lightswitch.off" : "lightswitch.on")
                        })
                        .font(.system(size: 28))
                        .frame(width: 64, height: 64)
                        .glassEffect(.regular.interactive())
                        
                        
                    })
                    
                    GlassEffectContainer(spacing: 8, content: {
                        
                        VStack(alignment: .center) {
                            if isBadgesExpanded {
                                BadgesView()
                            }
                            Button(action: {
                                withAnimation {
                                    isBadgesExpanded.toggle()
                                }
                            }, label: {
                                Image(systemName: isBadgesExpanded ? "xmark" : "circle.fill")
                            })
                            .font(.system(size: 28))
                            .frame(width: 64, height: 64)
                            .glassEffect(.regular.interactive())
                        }
                        .padding(.trailing)
                    })
                    
                }
            }
            
            
            
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button(action: {}, label: {
                    Image(systemName: "chevron.up")
                })
                Button(action: {}, label: {
                    Image(systemName: "chevron.down")
                })
            }
            
            ToolbarSpacer(.fixed, placement: .topBarTrailing)
            
            ToolbarItemGroup(placement: .primaryAction) {
                Button(action: {
                    showConfirmation = true
                }, label: {
                    Image(systemName: "checkmark")
                })
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .confirmationDialog("Validation",
                                    isPresented: $showConfirmation,
                                    titleVisibility: .visible,
                                    actions: {
                    Button("Valider", role: .destructive) {
                        
                    }
                    Button("Annuler") {
                    }
                }, message: {
                    Text("Valider cette action?")
                })
                
            }
            
            
            
            ToolbarSpacer(.fixed, placement: .topBarTrailing)
            
            ToolbarItemGroup(placement: .primaryAction) {
                Menu("", systemImage: "ellipsis", content: {
                    Button("Menu Action 1", action: {})
                    Button("Menu Action 2", action: {})
                    Button("Menu Action 3", action: {})
                })
            }
            
        }
        .navigationTitle("Toolbar Items")
        
    }
    
    
}

fileprivate struct ShowsBadgesViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    BadgesView()
                        .padding()
                }
            }
        }
    }
}

extension View {
    
    func showsBadges() -> some View {
        modifier(ShowsBadgesViewModifier())
    }
    
    
}

struct BadgesView: View {
    
    @Namespace var namespace
    
    
    var body: some View {
        VStack {
            Image(systemName: "triangle.fill")
                .font(.system(size: 28))
                .foregroundStyle(.red)
                .frame(width: 64, height: 64)
                .glassEffect(.regular, in: .rect(cornerRadius: 16))
                .glassEffectUnion(id: 2, namespace: namespace)
            Image(systemName: "pentagon.fill")
                .font(.system(size: 28))
                .foregroundStyle(.blue)
                .frame(width: 64, height: 64)
                .glassEffect(.regular, in: .rect(cornerRadius: 16))
                .glassEffectUnion(id: 3, namespace: namespace)
            Image(systemName: "square.fill")
                .font(.system(size: 28))
                .foregroundStyle(.green)
                .frame(width: 64, height: 64)
                .glassEffect(.regular, in: .rect(cornerRadius: 16))
                .glassEffectUnion(id: 4, namespace: namespace)
            Image(systemName: "heart.fill")
                .font(.system(size: 28))
                .foregroundStyle(.purple)
                .frame(width: 64, height: 64)
                .glassEffect(.regular, in: .rect(cornerRadius: 16))
                .glassEffectUnion(id: 5, namespace: namespace)
            Image(systemName: "seal.fill")
                .font(.system(size: 28))
                .foregroundStyle(.orange)
                .frame(width: 64, height: 64)
                .glassEffect(.regular, in: .rect(cornerRadius: 16))
                .glassEffectUnion(id: 7, namespace: namespace)
        }
        
    }
}

struct SecondaryView: View {
    var body: some View {
        VStack {
            Text("Secondary View!")
            Text("Top items are morphing")
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button(action: {}, label: {
                    Image(systemName: "checkmark")
                })
                .buttonStyle(.borderedProminent)
                .tint(.purple)
            }
            
            ToolbarSpacer(.fixed, placement: .primaryAction)
            
            ToolbarItemGroup(placement: .primaryAction) {
                Button(action: {}, label: {
                    Image(systemName: "ellipsis")
                })
            }
            
        }
        .navigationTitle("Secondary View")
        
    }
}


struct ToolbarItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToolbarItemsView()
                .previewDevice("iPhone 16")
        }
    }
}
