//
//  MainMenu.swift
//  SwiftUI Combine
//
//  Created by occmobility on 17/02/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import SwiftUI

struct NavigationBarBuilder: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
        
    var build: (UINavigationController) -> Void = {_ in }
        
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationBarBuilder>) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationBarBuilder>) {
        if let navigationController = uiViewController.navigationController {
            self.build(navigationController)
        }
    }
    
}

struct MainMenu: View {
    
    var body: some View {
        List{
            Section(header:Text("Tutoriels AppCoda"), content: {
                MainMenuRow(title: "Chapitre 6: Boutons, labels, gradients", destination:
                    ButtonsGradientsView().transition(.scale))
                MainMenuRow(title: "Chapitre 7: States et Bindings", destination:
                    StateBindingsView().transition(.scale))
                MainMenuRow(title: "Chapitre 17: Gestures", destination:
                    GesturesView().transition(.scale))
                MainMenuRow(title: "Chapitre 17: Gestures - Exercice", destination:
                    GesturesExerciseView().transition(.scale))
                MainMenuRow(title: "Chapitre 18: Bottom Sheet", destination:
                    ExpandableBottomSheetShowCase().transition(.scale))
                MainMenuRow(title: "Chapitre 19: Tinder Like Swipe", destination:
                    TinderLikeSwipe().transition(.scale))
                MainMenuRow(title: "Chapitre 26: AppStore Like Cards", destination:
                    AppStoreLike().transition(.scale))
            })
        }.navigationBarTitle(Text("Expérimentations"))
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView  {
            MainMenu()
        }
    }
}
