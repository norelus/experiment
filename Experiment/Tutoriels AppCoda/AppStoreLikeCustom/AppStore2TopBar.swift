//
//  AppStoreTopBar.swift
//  Experiment
//
//  Created by Aurélien Caille on 11/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AppStore2TopBar: View {
    
    var onBackPressed: (() -> Void)
    
    struct Avatar: View {
        
        var image: String
        var width: CGFloat
        var height: CGFloat
        
        var body: some View {
            Image(image)
                .resizable()
                .frame(width: width, height: height)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
        }
    }
    
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Button(action: {
                onBackPressed()
            }) {
                Image(systemName: "chevron.backward")
                    .font(.largeTitle)
            }.padding(.trailing)
            VStack(alignment: .leading) {
                Text(getCurrentDate().uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("Tomorrow")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            Spacer()
            Avatar(image: "chevre", width: 40, height: 40)
        }
    }
    
    func getCurrentDate(with format: String = "EEEE, MMM d") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
    
}

struct AppStore2TopBar_Previews: PreviewProvider {
    static var previews: some View {
        AppStore2TopBar(onBackPressed: {})
    }
}
