//
//  Refreshable.swift
//  Experiment
//
//  Created by Aurélien Caille on 22/06/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct SWApiPlanetsResponse: Decodable {
    var count: Int
    var results: [SwapiPlanet]
}

struct SwapiPlanet: Decodable {
    var name: String
    var terrain: String
    var population: String
}

struct Planet: Identifiable {
    var id: UUID = UUID()
    var name: String
    var terrain: String
    var population: String
}


struct RefreshableSearchable: View {
    
    @State var planets: [Planet] = [Planet(name: "Dummy", terrain: "sol dummique", population: "rien")]
    
    @State private var searchText = ""
    
    var searchedPlanets: [Planet] {
            if searchText.isEmpty {
                return planets
            } else {
                return planets.filter { $0.name.contains(searchText) }
            }
        }
    
    var body: some View {
        List(searchedPlanets) { planet in
            VStack(alignment: .leading) {
                Text("\(planet.name)").bold()
                Text("\(planet.terrain), population : \(planet.population)")
            }
        }.searchable(text: $searchText) {
            ForEach(searchedPlanets) { planet in
                Text("Suggestion: \(planet.name)").searchCompletion(planet.name)
            }
        }
        .refreshable {
            await updatePlanets()
        }.safeAreaInset(edge: .bottom) {
            HStack {
                Text("Searched for")
                Spacer()
                Text(searchText).foregroundStyle(.secondary)
            }.padding().background(.thinMaterial)
        }.navigationTitle("Refresh & search")
    }
    
    func fetchPlanets() async throws -> SWApiPlanetsResponse {
        let url = URL(string: "https://swapi.dev/api/planets")!
        let (data, _)  = try await URLSession.shared.data(from: url)
        let string = String(data: data, encoding: .utf8)
        print ("SWAPI response = \(string ?? "nil")")
        return try JSONDecoder().decode(SWApiPlanetsResponse.self, from: data)
    }
    
    
    func updatePlanets() async {
        do {
            print("update planets")
            let response = try await fetchPlanets()
            let planets = response.results
            self.planets = planets.map {
                Planet(name: $0.name, terrain: $0.terrain, population: $0.population)
            }
            print("\(self.planets.count) planets found")
        } catch let error {
            print("Error : \(error)")
        }
    }
}

struct RefreshableSearchable_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RefreshableSearchable()
        }
    }
}
