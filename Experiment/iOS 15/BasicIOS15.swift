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
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Bonjour Monde!")
                .font(.largeTitle.bold())
                .scaleEffect(agrandi ? 1.5 : 1)
                .animation(.linear, value: agrandi) //anime que la valeur en question
            HStack {
                Button(action: {
                    agrandi.toggle()
                }) {
                    Text("Taille")
                }
                Button(action: {
                    dismiss()
                }) {
                    Text("Quitter")
                }
                
            }
        }
    }
}

struct BasicIOS15_Previews: PreviewProvider {
    static var previews: some View {
        BasicIOS15()
    }
}

