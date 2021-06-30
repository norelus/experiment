//
//  AppStoreLikeBasic.swift
//  Experiment
//
//  Created by Aurélien Caille on 30/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AppStoreLikeBasic: View {
    

    let contents: [BasicAppStoreContent] = [
        .init(title: "Rose gencive", color: Color(red: 0.95, green: 0.4, blue: 0.45)),
        .init(title: "Vert soupe de brocolis", color: Color(red: 0.45, green: 0.7, blue: 0.2)),
        .init(title: "Gris caillou", color: .gray),
        .init(title: "Orange orange", color: Color(red: 1.0, green: 0.55, blue: 0.1)),
        .init(title: "Marron marron", color: Color(red: 0.5, green: 0.3, blue: 0.1))
    ]
    
    var body: some View {
        AppStoreLikeList(topBar:Text("Bonjour"), contents: contents, cellHeight: 200)
    }
    
}

struct AppStoreLikeBasic_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreLikeBasic()
    }
}
