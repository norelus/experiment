//
//  StateBindingsView.swift
//  Experiment
//
//  Created by Aurélien Caille on 05/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI


struct CounterButton: View {

    @Binding var counter: Int

    var color: Color

    var body: some View {
        Button(action: {
            self.counter += 1
        }) {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
                .overlay(
                    Text("\(counter)")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )
        }
    }
}



struct StateBindingsView: View {
    
    @State var counter = 10
    
    var body: some View {
        VStack {
            CounterButton(counter: $counter, color: .red)
            CounterButton(counter: $counter, color: .green)
            CounterButton(counter: $counter, color: .blue)
        }
    }
}

struct StateBindingsView_Previews: PreviewProvider {
    static var previews: some View {
        StateBindingsView()
    }
}
