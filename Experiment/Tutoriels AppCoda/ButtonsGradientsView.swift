//
//  ButtonsGradientsView.swift
//  Experiment
//
//  Created by Aurélien Caille on 04/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ButtonsGradientsView: View {
    var body: some View {
        VStack {
            Text("Buttons and gradients")
            Button( action: {
                print("clicked")
            }) {
                Text("Bonjour")
            }
        }
    }
}

struct ButtonsGradientsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsGradientsView()
    }
}
