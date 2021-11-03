//
//  LabelledProgressRingView.swift
//  Experiment
//
//  Created by Aurélien Caille on 03/11/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct LabelledProgressRingView: View {
    
    @Binding var points: Double
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            ProgressRingView(thickness: 10,
                             backgroundThickness: 5,
                             backgroundColor: .gray,
                             width: 150.0,
                             gradient: Gradient(colors: [.darkGreen, .lightGreen]),
                             startAngle: -180,
                             progress: $progress)
            VStack {
                AnimatedNumberCounter(number: points,
                                      foregroundColor: .green,
                                      font: .largeTitle)
                Text("Points")
                    .foregroundColor(.green)
                    .font(.title)
            }
        }
    }
}

struct LabelledProgressRingView_Previews: PreviewProvider {
    static var previews: some View {
        LabelledProgressRingView(points: .constant(500), progress: .constant(0.5))
    }
}
