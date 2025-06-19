//
//  Draggables.swift
//  Experiment
//
//  Created by Aurélien Caille on 18/06/2025.
//  Copyright © 2025 norelus. All rights reserved.
//


import SwiftUI

struct RichTextEditorView: View {
    
    
    @State var commentText: AttributedString = AttributedString("texte riche")
    
    var body: some View {
        ScrollView() {
            Text("En passant un AttributedString a un TextEditor on debloque les options de style")
            TextEditor(text: $commentText)
                .onChange(of: commentText, perform: { value in //on change, nouveauté iOS 14 :)
                    print("text content changé par = \(value)")
                })
                .border(Color.gray, width: 1)
                .lineLimit(3)
                .frame(height: 200)
        }
        .navigationTitle("RichTextEditor")
         
        
    }
    
}


struct RichTextEditorView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        NavigationView {
            RichTextEditorView()
        }
    }
}

