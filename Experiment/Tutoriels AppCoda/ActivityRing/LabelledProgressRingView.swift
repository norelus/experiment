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
            ProgressRingView(progress: $progress)
            VStack {
                AnimatedNumberCounter(number: points,
                                      foregroundColor: .blue,
                                      font: .largeTitle)
            }
        }
    }
}

struct LabelledProgressRingView_Previews: PreviewProvider {
    static var previews: some View {
        LabelledProgressRingView(points: .constant(500), progress: .constant(0.5))
    }
}
