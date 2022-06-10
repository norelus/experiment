//
//  MapFunctions.swift
//  SwiftUI Combine
//
//  Created by Aurélien Caille on 11/08/2020.
//  Copyright © 2020 Worldline. All rights reserved.
//

import SwiftUI
import MapKit

struct MapFunctions: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.642289 , longitude: 3.022828), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
            Text("Latitude: \(region.center.latitude), longitude: \(region.center.longitude)")
        }.navigationTitle("Region binding")
    }
}

struct MapFunctions_Previews: PreviewProvider {
    static var previews: some View {
        MapFunctions()
    }
}
