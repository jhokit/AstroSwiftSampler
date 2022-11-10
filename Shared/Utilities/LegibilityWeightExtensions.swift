//
//  LegibilityWeightExtensions.swift
//  AstroSwiftSampler
//
//  Created by Jeff Hokit on 11/9/22.
//

import SwiftUI


extension LegibilityWeight :Identifiable, CaseIterable {
    public static var allCases: [LegibilityWeight] = [LegibilityWeight.regular, LegibilityWeight.bold]
    
    public var id: Self { self } // Add id and Identifiable conformance to use in ForEeach

    // LegibilityWeight does not conform to RawRepresentable or Codable, so add functions to map to/from int for storage in UserDefaults
    
    // Init a LegibilityWeight from an int
    init(_ intValue:Int){
        if intValue == 0{
            self = .regular
        } else {
            self = .bold
        }
    }
    
    // Get an int representation of a LegibilityWeight
    var intValue:Int{
        if self == .regular {
            return 0
        } else {
            return 1
        }
    }

    // return the name of the LegibilityWeight
    var name:String{
        return "\(self)" // this trick returns the name of the enumeration
    }
}
