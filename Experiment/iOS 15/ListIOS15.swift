//
//  ListIOS15.swift
//  Experiment
//
//  Created by Aurélien Caille on 21/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct Information: Identifiable {
    var id: Int
    var label: String
    var value: String
}

struct Person: Identifiable {
    var id: UUID
    var firstName: String
    var lastName: String
}

struct ListIOS15: View {
    
    @State var informations: [Information] = [
        .init(id: 0, label: "Nom", value: "Jean"),
        .init(id: 1, label: "Prénom", value: "Dupont"),
        .init(id: 2, label: "Numéro de tèl.", value: "")
    ]
    
    @State var people: [Person] = [
        .init(id: UUID(), firstName: "Bob", lastName: "Grémus"),
        .init(id: UUID(), firstName: "Sylvaine", lastName: "Ploumyade"),
        .init(id: UUID(), firstName: "Sylvain", lastName: "Pakpatou"),
   ]
    
    var firstName: String {
        informations[0].value
    }
    
    var lastName: String {
        informations[1].value
    }
        

    
    var body: some View {
        VStack {
            EditableList(informations: $informations)
            Button(action: {
                people.append(.init(id: UUID(), firstName: firstName, lastName: lastName))
            }, label: {
                Label {
                    Text("Ajouter \(firstName) \(lastName)")
                }
                icon: {
                    Image(systemName: "plus")
                }
            })
                .tint(.indigo)
                .buttonStyle(.bordered)
                .headerProminence(.increased)
            PeopleList(people: $people)
        }.navigationTitle("Liste éditable")
    }
}

struct EditableList: View {
        
    @Binding var informations: [Information]
    
    var body: some View {
        VStack {
            ForEach($informations) { $info in
                Label {
                    TextField(info.label, text: $info.value)
                } icon: {
                    Image(systemName: "pencil")
                }
            } .padding(4)
        }
    }
}

struct PeopleList: View {
        
    @Binding var people: [Person]
    
    var formattedNames: String {
        people.map(\.firstName).formatted()
    }
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(people) { person in
                Text("\(person.firstName) \(person.lastName)")
            }
            .listRowSeparatorTint(Color("accent"))
            .swipeActions(edge: .leading) { Button("Dire Bonjour") {
                    print("Bonjour!")
            }.tint(.green)
            }
            .swipeActions(edge: .trailing, allowsFullSwipe: false) { Button("Supprimer", role: .destructive) {
                    print("Supprimage!")
                }
            }
        }.safeAreaInset(edge: .bottom) {
            HStack {
                Text("Bonjour à \(formattedNames)")
                Spacer()
            }
            .padding(8)
            .background(Color.red)
        }
    }
}


struct ListIOS15_Previews: PreviewProvider {
    static var previews: some View {
        ListIOS15()
    }
}
