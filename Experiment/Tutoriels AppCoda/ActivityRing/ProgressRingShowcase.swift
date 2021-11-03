//
//  ProgressRingShowcase.swift
//  Experiment
//
//  Created by Aurélien Caille on 03/11/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ProgressRingShowcase: View {
    
    @State var progress: Double = 0.0
    @State var points: Double = 0
    
    let maxPoints: Double = 2000
    let anim = Animation.linear(duration: 1.0)
    
    var body: some View {
        
        VStack(spacing: 16) {
            LabelledProgressRingView(points: $points, progress: $progress)
            Slider(value: $points, in: 0...maxPoints)
            
            HStack {
                Group {
                    Text("0%")
                        .onTapGesture {
                            withAnimation(anim) {
                                self.progress = 0
                            }
                        }

                    Text("25%")
                        .onTapGesture {
                            withAnimation(anim) {
                                self.progress = 0.25
                            }
                        }

                    Text("50%")
                        .onTapGesture {
                            withAnimation(anim) {
                                self.progress = 0.5
                            }
                        }

                    Text("75%")
                        .onTapGesture {
                            withAnimation(anim) {
                                self.progress = 0.75
                            }
                        }

                    Text("100%")
                        .onTapGesture {
                            withAnimation(anim) {
                                self.progress = 1.0
                            }
                        }
                }
                .font(.system(.headline, design: .rounded))
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 5.0, style: .continuous))
                
            }.padding()
             
        }.onChange(of: points, perform: { value in
            
            progress = value / maxPoints
        }).onChange(of: progress, perform: { value in
            withAnimation(anim) {
                points = maxPoints * value
            }
        })
    }
    
    
}

struct ProgressRingShowcase_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRingShowcase()
    }
}
