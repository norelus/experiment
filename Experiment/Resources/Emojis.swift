//
//  File.swift
//  SwiftUI Combine
//
//  Created by Aurélien Caille on 11/08/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import Foundation

struct Emojis {
    
    static func getAll() -> [String]{
        /*
        let emojiRanges = [
            0x1F601...0x1F64F,
            0x2702...0x27B0,
            0x1F680...0x1F6C0,
            0x1F170...0x1F251
        ]
        */
        let emojiRanges = [
            0x1F600...0x1F64F, // Emoticons
           0x1F300...0x1F5FF, // Misc Symbols and Pictographs
           0x1F680...0x1F6FF, // Transport and Map
           0x1F1E6...0x1F1FF, // Regional country flags
           0x2600...0x26FF,   // Misc symbols 9728 - 9983
           0x2700...0x27BF,   // Dingbats
           0xFE00...0xFE0F,   // Variation Selectors
           0x1F900...0x1F9FF,  // Supplemental Symbols and Pictographs 129280 - 129535
           0x1F018...0x1F270, // Various asian characters           127000...127600
           65024...65039, // Variation selector
           9100...9300, // Misc items
           8400...8447
        ]
        
        var result: [String] = []

        for range in emojiRanges {
            for i in range {
                var c = String(UnicodeScalar(i)!)
                result.append(c)
            }
        }
        
        return result
    }
    
}
