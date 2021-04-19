//
//  GesturesExerciseView.swift
//  Experiment
//
//  Created by Aurélien Caille on 05/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct GesturesExerciseView: View {
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        blueCircle
            .navigationBarTitle("Gestures - Exercice")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                // action
                mode.wrappedValue.dismiss()
            }){
                Text("\(Image(systemName: "chevron.left")) \("On s'en va")")
                    .foregroundColor(.orange)
            })
    }
    
    var blueCircle: some View {
        ResizableView {
            Image(systemName: "star.circle.fill")
                .foregroundColor(.blue)
                .font(.system(size: 200))
        }
    }
}

struct GesturesExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesExerciseView()
    }
}
