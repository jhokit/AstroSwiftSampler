//
//  AstroColorSamples.swift
//  AstroSwiftSampler
//
//  Created by rocketjeff on 1/13/22.
//

import Foundation
import AstroSwiftCore
import AstroSwiftFoundation
import SwiftUI


struct AstroColorSamples
{
    static var corePrimary:ColorSample = ColorSample(name: "Astro UI Primary", color: Color.astroUIPrimary, colorVariants:  [
        ColorSample(name:"Astro UI Primary", color: Color.astroUIPrimary),
        ColorSample(name:"Astro UI Primary Darken 1", color: Color.astroUIPrimaryDarken1),
        ColorSample(name:"Astro UI Primary Darken 2", color: Color.astroUIPrimaryDarken2),
        ColorSample(name:"Astro UI Primary Darken 3", color: Color.astroUIPrimaryDarken3),
        ColorSample(name:"Astro UI Primary Darken 4", color: Color.astroUIPrimaryDarken4),
        ColorSample(name:"Astro UI Primary Lighten 1", color: Color.astroUIPrimaryLighten1),
        ColorSample(name:"Astro UI Primary Lighten 2", color: Color.astroUIPrimaryLighten2),
        ColorSample(name:"Astro UI Primary Lighten 3", color: Color.astroUIPrimaryLighten3),
        ColorSample(name:"Astro UI Primary Lighten 4", color: Color.astroUIPrimaryLighten4)
    ])
    
    static var coreSecondary:ColorSample = ColorSample(name: "Astro UI Secondary", color: Color.astroUISecondary, colorVariants: [
        ColorSample(name:"Astro UI Secondary", color: Color.astroUISecondary),
        ColorSample(name:"Astro UI Secondary Darken 1", color: Color.astroUISecondaryDarken1),
        ColorSample(name:"Astro UI Secondary Darken 2", color: Color.astroUISecondaryDarken2),
        ColorSample(name:"Astro UI Secondary Darken 3", color: Color.astroUISecondaryDarken3),
        ColorSample(name:"Astro UI Secondary Darken 4", color: Color.astroUISecondaryDarken4),
        ColorSample(name:"Astro UI Secondary Lighten 1", color: Color.astroUISecondaryLighten1),
        ColorSample(name:"Astro UI Secondary Lighten 2", color: Color.astroUISecondaryLighten2),
        ColorSample(name:"Astro UI Secondary Lighten 3", color: Color.astroUISecondaryLighten3),
        ColorSample(name:"Astro UI Secondary Lighten 4", color: Color.astroUISecondaryLighten4)
    ])
    
    static var astroUI:ColorSample = ColorSample(name: "Astro UI", color: Color.astroUIPrimary, colorVariants: [
        corePrimary,
        coreSecondary
    ])

}
