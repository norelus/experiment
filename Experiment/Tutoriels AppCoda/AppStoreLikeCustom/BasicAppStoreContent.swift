//
//  BasicAppStoreContent.swift
//  Experiment
//
//  Created by Aurélien Caille on 30/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI


struct BasicAppStoreContent: View, Identifiable {

    var id: String
    var title: String
    var color: Color
    var viewAnimation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .top) {
            color
                .matchedGeometryEffect(id: "background_\(id)", in: viewAnimation)
                
            ScrollView(.vertical) {
                VStack {
                    Text(title).font(.largeTitle).frame(height: 200)
                        .matchedGeometryEffect(id: "title_\(id)", in: viewAnimation)
                        
                    Text("Lorem ipsum etc.").padding(.top)
                        .matchedGeometryEffect(id: "content_\(id)", in: viewAnimation)
                        
                }
            }
        }
    }
    
}

/*
struct BasicAppStoreContent_Previews: PreviewProvider {
    static var previews: some View {
        BasicAppStoreContent(id: "999", title: "rouge", color: .red)
    }
}
*/
