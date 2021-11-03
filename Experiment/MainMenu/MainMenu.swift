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
    
    @Binding var showAppStore2: Bool
    
    struct Option : Identifiable {
        var id = UUID()
        
        var title: String
        var destination: AnyView
        
        init<Destination: View>(title: String, destination: Destination) {
            self.title = title
            self.destination = AnyView(destination)
        }
    }
    
    var iOSQuinzeOptions = [
        Option(title: "Basiques", destination: BasicIOS15()),
        Option(title: "Matériaux et styles de texte", destination: Materials()),
        Option(title: "Async Images", destination: AsyncImagesIOS15()),
        Option(title: "Listes new stuff", destination: ListIOS15()),
        Option(title: "Refreshable / Searchable", destination: RefreshableSearchable())
    ]
    
    var appCodaOptions = [
        Option(title: "Chapitre 6: Boutons, labels, gradients",
               destination: ButtonsGradientsView()),
        Option(title: "Chapitre 7: States et Bindings",
               destination: StateBindingsView()),
        Option(title: "Chapitre 12: Modals et Alertes",
               destination: ModalsAndAlerts()),
        Option(title: "Chapitre 15: Formulaire avec Combine et ViewModel",
               destination: CombineForm()),
        Option(title: "Chapitre 17: Gestures",
               destination: GesturesView()),
        Option(title: "Chapitre 17: Gestures - Exercice",
               destination: GesturesExerciseView()),
        Option(title: "Chapitres 16 & 18: Context Menu / Swipe to delete / Bottom Sheet",
               destination: ContextSwipeBottomsheet()),
        Option(title: "Chapitre 19: Tinder Like Swipe",
               destination: TinderLikeSwipe()),
        Option(title: "Chapitre 22: Todo List CoreData",
               destination: TodoListCoreData()),
        Option(title: "CoreData Test",
               destination: CoreDataTest()),
        Option(title: "Chapitre 26: AppStore Like Cards",
               destination: AppStoreLike()),
        Option(title: "AppStore like Basic",
               destination: AppStoreLikeBasic()),
        Option(title: "AppStore like avec articles",
               destination: AppStoreLike2()),
    ]
    
    var body: some View {
        List{
            Section(header:
                        Text("iOS 15")
                        .padding(8)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(16)
                    , content: {
                
                ForEach(iOSQuinzeOptions) { option in
                    MainMenuRow(title: option.title, destination: option.destination.transition(.scale))
                }
            })
            Section(header:
                        Text("Tutoriels AppCoda")
                        .padding(8)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(16)
                    , content: {
                
                ForEach(appCodaOptions) { option in
                    MainMenuRow(title: option.title, destination: option.destination.transition(.scale))
                }
                Text("AppStore Like Custom Version")
                    .onTapGesture {
                        withAnimation {
                            showAppStore2 = true
                        }
                    }
                    .listRowBackground(Color(.systemGray4))
            })
        }.background(Color.clear)
        .navigationBarTitle("Menu")
        
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView  {
            MainMenu(showAppStore2: .constant(false))
            VStack {
                Text("Bienvenue").font(.title)
            }
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .accentColor(.orange)//change la couleurs de tous les boutons :)
    }
}
