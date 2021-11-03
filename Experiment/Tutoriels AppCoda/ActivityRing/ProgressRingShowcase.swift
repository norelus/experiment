//
//  ProgressRingShowcase.swift
//  Experiment
//
//  Created by Aurélien Caille on 03/11/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ProgressRingShowcase: View {
    
    @State var progress = 0.0
    
    var body: some View {
        
        VStack {
            ProgressRingView(progress: $progress)

            HStack {
                Group {
                    Text("0%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.0
                        }

                    Text("50%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.5
                        }

                    Text("100%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 1.0
                        }
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                .padding()
            }
            .padding()
        }
    }
}

struct ProgressRingShowcase_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRingShowcase()
    }
}
