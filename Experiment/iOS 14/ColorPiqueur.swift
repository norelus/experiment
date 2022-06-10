//
//  ColorPiqueur.swift
//  SwiftUI Combine
//
//  Created by Aurélien Caille on 11/08/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import SwiftUI

struct ColorPiqueur: View {
    
    @State var colorPicked = Color.pink
    
    var body: some View {
        VStack(alignment: .center) {
              Text("Piqueur de couleur")
                .foregroundColor(colorPicked).font(.largeTitle)
              ColorPicker(
                "Pick a color",
                selection: $colorPicked
              ).frame(width: 150, height: 150)
              Spacer()
            }.padding(.vertical, 70)
    }
}

struct ColorPiqueur_Previews: PreviewProvider {
    static var previews: some View {
        ColorPiqueur()
    }
}
