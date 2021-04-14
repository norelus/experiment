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
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = navBarBackgroundColor
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: navBarTextColor]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: navBarTextColor]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
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
            }.navigationViewStyle(DoubleColumnNavigationViewStyle())
            .accentColor(.orange)//change la couleurs de tous les boutons :)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
