//
//  AstroSymbolSamples.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/9/22.
//

import Foundation


struct AstroSymbolSamples
{
    static var standardSymbols =  [
        SymbolSample(name:"astro.altitude"),
        SymbolSample(name:"astro.antenna-off"),
        SymbolSample(name:"astro.antenna-receive"),
        SymbolSample(name:"astro.antenna"),
        SymbolSample(name:"astro.equipment"),
        SymbolSample(name:"astro.mission"),
        SymbolSample(name:"astro.netcom"),
        SymbolSample(name:"astro.payload"),
        SymbolSample(name:"astro.processor-alt"),
        SymbolSample(name:"astro.processor"),
        SymbolSample(name:"astro.propulsion-power"),
        SymbolSample(name:"astro.satellite-off"),
        SymbolSample(name:"astro.satellite-receive"),
        SymbolSample(name:"astro.satellite-transmit"),
        SymbolSample(name:"astro.solar"),
        SymbolSample(name:"astro.thermal")
    ]
    
    
    static var statusSymbols =  [
        SymbolSample(name:"astro.off", status: .Off),
        SymbolSample(name:"astro.standby", status: .Standby),
        SymbolSample(name:"astro.normal", status: .Normal),
        SymbolSample(name:"astro.caution", status: .Caution),
        SymbolSample(name:"astro.serious", status: .Serious),
        SymbolSample(name:"astro.critical", status: .Critical)
    ]
}

