//
//  ContentView.swift
//  Experiment
//
//  Created by occmobility on 16/01/2020.
//  Copyright © 2020 norelus. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //A

    let accentColor = Color("accent")
    //B
    let persistenceController = PersistenceController.shared

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var showAppStore2 : Bool = false
    
    init() {
       
    }
    
    var body: some View {
        
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
