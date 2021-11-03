//
//  BasicIOS15.swift
//  Experiment
//
//  Created by Aurélien Caille on 12/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct BasicIOS15: View {
    
    @Environment(\.dismiss) private var dismiss //nouvelle méthode pour dismiss
    
    @State private var agrandi = false
    
    @State private var name: String = "Jeanine"
    
    @FocusState private var focused: Bool
    
    var body: some View {
        print("Dernier changement : \(Self._printChanges())")
        return ScrollView(.vertical) {
            VStack {
                Text("Bonjour \(name)!")
                    .font(.largeTitle.bold())
                    .scaleEffect(agrandi ? 1.5 : 1)
                    .animation(.linear, value: agrandi) //anime que la valeur en question
                Toggle("Agrandir", isOn: $agrandi)
                    .toggleStyle(.button)
                    .tint(.mint)
#if os(iOS)
                Text("Sur iOS")
#else
                Text("Sur MacOS")
#endif
                TextField("Mon nom", text: $name)
                    .focused($focused)
                    .submitLabel(.done)
                    .textFieldStyle(.roundedBorder)
                    .border(focused ? .green : .orange)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button("Cliquez-moi!") {
                                print("cliqué")
                                name = "Cliqueur"
                            }
                        }
                    }.padding()
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Quitter")
                    }
                    .buttonStyle(.bordered)
                    .headerProminence(.increased)
                    
                }
                Spacer()
            }
        }.navigationTitle("Basiques iOS 15")
    }
}

struct BasicIOS15_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasicIOS15()
                .previewInterfaceOrientation(.landscapeLeft)
            BasicIOS15()
                .previewInterfaceOrientation(.portrait)
        }
    }
}

