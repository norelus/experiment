//
//  FirstView.swift
//  Experiment
//
//  Created by occmobility on 16/01/2020.
//  Copyright © 2020 norelus. All rights reserved.
//

import SwiftUI

struct CellContent: Identifiable {
    
    var id: Int
    var content: String
    
}

struct FirstView: View {
    
    let laData = [CellContent(id: 0, content: "data un"),
                  CellContent(id: 1, content: "data deux"),
                  CellContent(id: 2, content: "data trois")]
    
    
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Cela est la first view vraiment")
                    .font(.headline)
                Text("Bienvenue")
                    .font(.subheadline)
                List {
                    ForEach(laData) {
                        data in
                        Text("Liste cellule = " + data.content)
                    }
                }
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
