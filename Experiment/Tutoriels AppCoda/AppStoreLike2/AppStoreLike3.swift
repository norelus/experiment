//
//  AppStoreLike3.swift
//  Experiment
//
//  Created by Aurélien Caille on 29/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AppStoreLike3: View {
    
    var body: some View {
        let green = AppStoreContent(title: "vert", color: .green)
        let red = AppStoreContent(title: "rouge", color: .red)
        let blue = AppStoreContent(title: "bleu", color: .blue)
        let grey = AppStoreContent(title: "gris", color: .gray)
        let contents = [green, red, blue, grey]
        return AppStoreLikeList(contents: contents)
    }
    
}

struct AppStoreLike3_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreLike3()
    }
}
