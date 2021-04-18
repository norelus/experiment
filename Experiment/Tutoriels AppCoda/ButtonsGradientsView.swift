//
//  ButtonsGradientsView.swift
//  Experiment
//
//  Created by Aurélien Caille on 04/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ButtonsGradientsView: View {
       
    @State var rotated: Bool = false
    
    struct GradientBackgroundStyle: ButtonStyle {
        
        let superGradient = LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing)
     
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .background(superGradient)
                .cornerRadius(40)
                .padding(2)
                .background(Color.white)
                .padding(2)
                .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.purple, lineWidth: 3))
        }
    }
    
    var body: some View {
        VStack {
            Button( action: {
                print("clicked")
            }) {
                Label(
                    title: {
                        Text("Supprimer")
                            .font(.title)
                    },
                    icon: {
                        Image(systemName: "trash")
                            .font(.title)
                    })
                    .font(.system(.title2, design: .rounded))
                    
            }
            .buttonStyle(GradientBackgroundStyle())
            .padding()
            
            Button(action: {
                rotated.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(.title)
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(30)
                    .rotationEffect(.init(degrees: rotated ? 45 : 0))
            })
        }.navigationTitle("Boutons et gradients")
    }
}

struct ButtonsGradientsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsGradientsView()
    }
}
