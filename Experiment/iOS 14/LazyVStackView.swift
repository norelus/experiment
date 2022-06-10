//
//  LazyRows.swift
//  SwiftUI Combine
//
//  Created by Aurélien Caille on 11/08/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import SwiftUI

struct ExampleRow: View {
    
    let number : Int
    
    var body: some View {
        Text ("Colonne numéro \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Chargement de la cellule \(number)")
    }
    
}

struct LazyVStackView: View {
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                LazyVStack {
                    Button("Scroll to 50") {
                        withAnimation(.easeInOut(duration: 5)) {//paramétres ignorés pour l'instant :)
                            value.scrollTo(50, anchor: .top)
                        }
                    }.padding()
                    ForEach(1...1000, id: \.self) { i in
                        ExampleRow(number: i).id(i)
                    }
                }
            }
        }.navigationTitle("Lazy VStack + Scroll To")
    }
}

struct LazyRows_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStackView()
    }
}
