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
            })
            /*
            Section(header:Text("Composants"), content: {
                MainMenuRow(title: "Composants de base", destination: Components().transition(.scale))
            })
            Section(header:Text("Animations"), content: {
                MainMenuRow(title: "Animations de base", destination: Animations())
                MainMenuRow(title: "Composant Lottie", destination: LottieExample())
            })
            Section(header:Text("Interactions"), content: {
                MainMenuRow(title: "Formulaire et EnvironmentObject", destination: UserPreferences())
                MainMenuRow(title: "Networking & ViewModel", destination: Networking())
            })
            Section(header:Text("UIKit"), content: {
                MainMenuRow(title: "Intégration d'UIKit", destination: UIKitContentView())
                MainMenuRow(title: "Combine avec UIKit", destination: CombineUIKitContentView())
            })
            Section(header:Text("Ajouts iOS 14"), content: {
                MainMenuRow(title: "Composants de base", destination: BasicsIOS14())
                MainMenuRow(title: "Lazy VStack et ScrollTo", destination: LazyVStackView())
                MainMenuRow(title: "Grid", destination: GridView())
                MainMenuRow(title: "Piquage de couleur", destination: ColorPiqueur())
                MainMenuRow(title: "Player video (device only)", destination: PlayerView())
            })*/
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
