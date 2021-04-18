//
//  GesturesExerciseView.swift
//  Experiment
//
//  Created by Aurélien Caille on 05/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct GesturesExerciseView: View {
    var body: some View {
        blueCircle
            .navigationBarTitle("Gestures - Exercice")
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
