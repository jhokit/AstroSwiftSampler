//
//  SampleData.swift
//  AstroSwiftSampler
//
//  Created by rocketjeff on 5/3/22.
//

import SwiftUI


struct Item: Identifiable {
     let id = UUID()
     let name: String
 }

class Fruits: ObservableObject {
    @Published var fruits: [Item] = loadFruits()
    
    static func loadFruits() -> [Item] {
        return [
            Item(name: "Apple"),
            Item(name: "Avocado"),
            Item(name: "Banana"),
            Item(name: "Grapes"),
            Item(name: "Kiwi"),
            Item(name: "Peach"),
        ]
    }
}


class Zones: ObservableObject {
    @Published var zones: [Item] = loadZones()
    
    static func loadZones() -> [Item] {
        return [
            Item(name: "Pacific"),
            Item(name: "Mountain"),
            Item(name: "Central"),
            Item(name: "Eastern"),
        ]
    }
}


class Cities: ObservableObject {
    @Published var cities: [Item] = loadCities()
    
    static func loadCities() -> [Item] {
        return [
            Item(name: "San Luis Obispo"),
            Item(name: "Denver"),
            Item(name: "St. Louis"),
            Item(name: "Baltimore"),
        ]
    }
}


