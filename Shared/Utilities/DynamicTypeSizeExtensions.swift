//
//  DynamicTypeSizeExtensions.swift
//  AstroSwiftSampler
//
//  Created by Jeff Hokit on 11/9/22.
//

import SwiftUI


extension DynamicTypeSize:Identifiable {
    
    public var id: Self { self } // Add id and Identifiable conformance to use in ForEeach

    // DynamicTypeSize does not conform to RawRepresentable or Codable, so add functions to map to/from int for storage in UserDefaults
    
    // Init a DynamicTypeSize from an int
    init(_ intValue:Int){
        let cases = Self.allCases
        
        // default to first item if intValue is out of bounds
        guard  cases.indices.contains(intValue) else {
            self = cases[0]
            return
        }
           
        self = cases[intValue]
    }
    
    // Get an int representation of a DynamicTypeSize
    var intValue:Int{
        let cases = Self.allCases
        
        // default to zero if self is not found
        return cases.firstIndex(of: self) ?? 0
    }

    // return the name of the DynamicTypeSize
    var name:String{
        return "\(self)" // this trick returns the name of the enumeration
    }
}
