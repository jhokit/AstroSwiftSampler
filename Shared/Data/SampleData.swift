//
//  SampleData.swift
//  AstroSwiftSampler
//
//  Created by rocketjeff on 5/3/22.
//

import SwiftUI

/// Bits of sample data used to populate lists and menus
///
class Fruits: ObservableObject {
@Published var fruits: [Item] =  [
        Item(name: "Apple"),
        Item(name: "Avocado"),
        Item(name: "Banana"),
        Item(name: "Grapes"),
        Item(name: "Kiwi"),
        Item(name: "Peach"),]
}

class Zones: ObservableObject {
    @Published var zones: [Item] = [
            Item(name: "Pacific"),
            Item(name: "Mountain"),
            Item(name: "Central"),
            Item(name: "Eastern")]
}

class Cities: ObservableObject {
    @Published var cities: [Item] = [
        Item(name: "San Luis Obispo"),
        Item(name: "Denver"),
        Item(name: "St. Louis"),
        Item(name: "Baltimore")]
}

struct Item: Identifiable {
     let id = UUID()
     let name: String
 }
