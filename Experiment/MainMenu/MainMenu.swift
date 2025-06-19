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
    
    var iosQuatorzeOptions = [
        Option(title: "Basiques iOS 14", destination: BasicsIOS14()),
        Option(title: "Lazy VStack et ScrollTo", destination: LazyVStackView()),
        Option(title: "GridView", destination: GridView()),
        Option(title: "Piquage de couleur", destination: ColorPiqueur()),
        Option(title: "Player video (device only)", destination: PlayerView())
    ]
    
    var iOSQuinzeOptions = [
        Option(title: "Basiques iOS 15", destination: BasicIOS15()),
        Option(title: "Matériaux et styles de texte", destination: Materials()),
        Option(title: "Async Images", destination: AsyncImagesIOS15()),
        Option(title: "Listes new stuff", destination: ListIOS15()),
        Option(title: "Refreshable / Searchable", destination: RefreshableSearchable())
    ]
    
    var iosVingtSixOptions = [
        Option(title: "Toolbar items", destination: ToolbarItemsView()),
        Option(title: "WebView", destination: MyWebView()),
        Option(title: "Draggables", destination: RichTextEditorView())
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
        Option(title: "Chapitre 30: Activity Ring",
               destination: ProgressRingShowcase())
    ]
    
    var body: some View {
        List{
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
            
            
            Section(header:
                        Text("iOS 26")
                        .padding(8)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(16)
                    , content: {
                
                ForEach(iosVingtSixOptions) { option in
                    MainMenuRow(title: option.title, destination: option.destination.transition(.scale))
                }
            })
            
            
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
                        Text("iOS 14")
                        .padding(8)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(16)
                    , content: {
                
                ForEach(iosQuatorzeOptions) { option in
                    MainMenuRow(title: option.title, destination: option.destination.transition(.scale))
                }
            })
            
        }
        .listStyle(.plain)
        .navigationBarTitle("Menu")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    toggleAppearances()
                }, label: {
                    Image(systemName: "paintbrush")
                })
            }
        }
        
    }
    
    
    //https://developer.apple.com/documentation/uikit/uinavigationbarappearance
    let navBarTextColor = UIColor(white: 0.95, alpha: 1.0)
    
    let navBarBackgroundColor = UIColor(named:"navbar_background")
    let navBarAlternateBackgroundColor = UIColor(named:"navbar_background_2")
    
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
    
    func toggleAppearances() {
        UINavigationBar.appearance().standardAppearance = smallNavBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = largeNavBarAppearance
        UINavigationBar.appearance().compactAppearance = smallNavBarAppearance
        
        UITableView.appearance().backgroundColor = UIColor.clear
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
