//
//  AppStoreLikeBasic.swift
//  Experiment
//
//  Created by Aurélien Caille on 30/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AppStoreLikeBasic: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Namespace var viewAnimation
    
    var contents: [BasicAppStoreContent] { [
        .init(id: "0", title: "Rose gencive", color: Color(red: 0.95, green: 0.4, blue: 0.45), viewAnimation: viewAnimation),
        .init(id: "1", title: "Vert soupe de brocolis", color: Color(red: 0.45, green: 0.7, blue: 0.2), viewAnimation: viewAnimation),
        .init(id: "2", title: "Gris caillou", color: .gray, viewAnimation: viewAnimation),
        .init(id: "3", title: "Orange orange", color: Color(red: 1.0, green: 0.55, blue: 0.1), viewAnimation: viewAnimation),
        .init(id: "4", title: "Marron marron", color: Color(red: 0.5, green: 0.3, blue: 0.1), viewAnimation: viewAnimation)
    ]}
    
    var topBar: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")
                    .font(.largeTitle)
            }.padding()
            Text("Bonjour")
                .font(.largeTitle)
            Spacer()
        }
    }
    
    var body: some View {
        AppStoreLikeList(topBar:topBar, contents: contents, cellHeight: 200)
            .navigationBarHidden(true)
    }
    
}

struct AppStoreLikeBasic_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreLikeBasic()
    }
}
