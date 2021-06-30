//
//  AppStoreLikeBasic.swift
//  Experiment
//
//  Created by Aurélien Caille on 30/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AppStoreLikeBasic: View {
    var body: some View {
        let green = BasicAppStoreContent(title: "vert", color: .green)
        let red = BasicAppStoreContent(title: "rouge", color: .red)
        let blue = BasicAppStoreContent(title: "bleu", color: .blue)
        let grey = BasicAppStoreContent(title: "gris", color: .gray)
        let contents = [green, red, blue, grey]
        AppStoreLikeList(topBar:Text("Bonjour"), contents: contents, cellHeight: 250)
    }
}

struct AppStoreLikeBasic_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreLikeBasic()
    }
}
