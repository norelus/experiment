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
    let navBarAlternateBackgroundColor = UIColor(named:"navbar_background_2")
    
    let accentColor = Color("accent")
    
    let persistenceController = PersistenceController.shared

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var showAppStore2 : Bool = false
    
    var largeNavBarAppearance: UINavigationBarAppearance {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = navBarBackgroundColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: navBarTextColor]
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrowshape.turn.up.left"),
                                              transitionMaskImage: UIImage(systemName: "arrowshape.turn.up.left"))
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: navBarTextColor,
                                               .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        return navBarAppearance
    }
    
    var smallNavBarAppearance: UINavigationBarAppearance {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = navBarAlternateBackgroundColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: navBarTextColor]
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrowshape.turn.up.left"),
                                              transitionMaskImage: UIImage(systemName: "arrowshape.turn.up.left"))
        return navBarAppearance
    }
    
    //https://developer.apple.com/documentation/uikit/uinavigationbarappearance
    init() {
        UINavigationBar.appearance().standardAppearance = smallNavBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = largeNavBarAppearance
        UINavigationBar.appearance().compactAppearance = smallNavBarAppearance
        
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        
        if showAppStore2 {
            AppStoreLike2(isPresented: $showAppStore2)
                .transition(.move(edge: .trailing))
        } else {
            NavigationView {
                MainMenu(showAppStore2: $showAppStore2)
                  /*  .background(Image("space")
                                    .resizable()
                                    .scaledToFill()
                                    .ignoresSafeArea())*/
                VStack {
                    Text("Bienvenue").font(.title)
                    if horizontalSizeClass == .compact {
                        Text("Swipe à partir du bord gauche de l'écran pour afficher le menu sur iPad portrait (pas trouvé le moyen pour l'afficher tout le temps)").font(.caption)
                    }
                }
            }
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
            .accentColor(accentColor)//change la couleurs de tous les boutons :)
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
