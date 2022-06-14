//
//  SymbolSample.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/9/22.
//

import Foundation
import AstroSwiftFoundation

struct SymbolSample:Identifiable
{
    let id: UUID = UUID()
    var name:String
    var status:AstroStatus?
}
