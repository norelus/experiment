//
//  AppStoreTopBar.swift
//  Experiment
//
//  Created by Aurélien Caille on 11/04/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct AppStoreTopBar: View {
    
    @Environment(\.presentationMode) var presentationMode
    
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
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")
                    .font(.largeTitle)
            }.padding(.trailing)
            VStack(alignment: .leading) {
                Text(getCurrentDate().uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            Spacer()
            Avatar(image: "profile", width: 40, height: 40)
        }
    }
    
    func getCurrentDate(with format: String = "EEEE, MMM d") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
    
}

struct AppStoreTopBar_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreTopBar()
    }
}
