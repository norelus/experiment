//
//  BasicsIOS14.swift
//  SwiftUI Combine
//
//  Created by Aurélien Caille on 11/08/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import SwiftUI

struct BasicsIOS14: View {
    
    @State var textContent: String = "lorem ipsum etc."
    @State var loadingProgress = 0.0
   
    var body: some View {
        ScrollView {
            VStack {
                Text("Texte éditable multi ligne (3 lignes)")
                TextEditor(text: $textContent)
                    .onChange(of: textContent, perform: { value in //on change, nouveauté iOS 14 :)
                        print("text content changé par = \(value)")
                    })
                    .border(Color.gray, width: 1)
                    .lineLimit(3)
                    .frame(height: 200)
                Divider()
                Text("Indicateurs de chargement")
                ProgressView("Chargement simple...").padding()
                Divider()
                ProgressView("Indicateur de progrés", value: loadingProgress, total: 100).padding()
                Button("Avancer") {
                    loadingProgress += 5
                }
                Divider()
                Spacer()
            }
            .padding(16)
        }
        .navigationTitle("Nouveautés iOS 14")
    }
    
}

struct BasicsIOS14_Previews: PreviewProvider {
    static var previews: some View {
        BasicsIOS14()
            .previewDevice("iPhone 11")
    }
}
