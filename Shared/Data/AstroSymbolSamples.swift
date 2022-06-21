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
        SymbolSample(name:"astro.off", status: .off),
        SymbolSample(name:"astro.standby", status: .standby),
        SymbolSample(name:"astro.normal", status: .normal),
        SymbolSample(name:"astro.caution", status: .caution),
        SymbolSample(name:"astro.serious", status: .serious),
        SymbolSample(name:"astro.critical", status: .critical)
    ]
}

