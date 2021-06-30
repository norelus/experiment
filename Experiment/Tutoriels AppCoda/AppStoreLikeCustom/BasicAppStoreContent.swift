//
//  BasicAppStoreContent.swift
//  Experiment
//
//  Created by Aurélien Caille on 30/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI


struct BasicAppStoreContent: View {
    
    var title: String
    var color: Color
    
    var body: some View {
        ZStack(alignment: .top) {
            color
            ScrollView(.vertical) {
                VStack {
                    Text(title).font(.largeTitle).frame(height: 200)
                    Text("Lorem ipsum etc.").padding(.top)
                }
            }
        }
    }
    
}


struct BasicAppStoreContent_Previews: PreviewProvider {
    static var previews: some View {
        BasicAppStoreContent(title: "rouge", color: .red)
    }
}
