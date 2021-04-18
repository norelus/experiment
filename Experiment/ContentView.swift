//
//  ContentView.swift
//  Experiment
//
//  Created by occmobility on 16/01/2020.
//  Copyright © 2020 norelus. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let navBarTextColor = UIColor(white: 0.95, alpha: 1.0)
    let navBarBackgroundColor = UIColor(named:"navbar_background")
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var showAppStore2 : Bool = false
    
    //https://developer.apple.com/documentation/uikit/uinavigationbarappearance
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = navBarBackgroundColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: navBarTextColor]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: navBarTextColor,
                                               .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
       navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
    
    var body: some View {
        
        if showAppStore2 {
            AppStoreLike2(isPresented: $showAppStore2)
                .transition(.move(edge: .trailing))
        } else {
            NavigationView {
                MainMenu(showAppStore2: $showAppStore2)
                VStack {
                    Text("Bienvenue").font(.title)
                    if horizontalSizeClass == .compact {
                        Text("Swipe à partir du bord gauche de l'écran pour afficher le menu sur iPad portrait (pas trouvé le moyen pour l'afficher tout le temps)").font(.caption)
                    }
                }
            }
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
            .accentColor(.orange)//change la couleurs de tous les boutons :)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
