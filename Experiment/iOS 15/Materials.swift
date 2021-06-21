//
//  Materials.swift
//  Experiment
//
//  Created by Aurélien Caille on 12/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct Materials: View {
    var body: some View {
        ZStack {
            theList
            .background(.image(Image("space")))
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Text("Bottom view using safe area insets")
                    Spacer()
                    Text("Super").foregroundStyle(.secondary)
                }.padding(.vertical, 64)
                .padding(.horizontal, 16)
                .background(.thinMaterial)
            }
        }.ignoresSafeArea()
        
    }
        
    var theList: some View {
        ScrollView() {
            HStack {
                Spacer()
                VStack(spacing: 32) {
                    VStack {
                        Text("Regular material").font(.headline)
                        Text("Primary")
                            .foregroundStyle(.primary)
                        Text("Secondary")
                            .foregroundStyle(.secondary)
                        Text("Tertiary")
                            .foregroundStyle(.tertiary)
                        Text("Quaternary")
                            .foregroundStyle(.quaternary)
                    }
                    .padding(32)
                    .background(.regularMaterial)
                    .cornerRadius(16)
                    VStack {
                        Text("Thin material").font(.headline)
                        Text("Multiple \(Text("styles").foregroundColor(.red)) \(Text("in").bold()) \(Text("one").italic()) \(Text("Text element").font(.caption))")
                    }
                    .padding(32)
                    .background(.thinMaterial)
                    .cornerRadius(16)
                    VStack {
                        Text("Thick material").font(.headline)
                        
                    }
                    .padding(32)
                    .background(.thickMaterial)
                    .cornerRadius(16)
                    VStack{
                        Text("Ultrathin material").font(.headline)
                        
                    }
                    .padding(32)
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    Text("Ultrathick material").font(.headline)
                        .padding(32)
                        .background(.ultraThickMaterial)
                        .cornerRadius(16)
                    Spacer()
                }
                .padding(.top, 64)
                Spacer()
            }
        }
    }
    
}

struct Materials_Previews: PreviewProvider {
    static var previews: some View {
        Materials()
    }
}
