//
//  AnimatedNumberCounter.swift
//  Experiment
//
//  Created by Aurélien Caille on 03/11/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AnimatedNumberCounter: View, Animatable {
    
    var number: CGFloat
    var foregroundColor: Color
    var font: Font
    
    var animatableData: CGFloat {
        get { number }
        set { number = newValue }
    }
    
    var body: some View {
        Text("\(Int(number))")
            .font(font)
            .foregroundColor(foregroundColor)
            .minimumScaleFactor(0.1)
    }
    
}

struct AnimatedNumberCounter_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedNumberCounter(number: 50, foregroundColor: .blue, font: .largeTitle)
    }
}
