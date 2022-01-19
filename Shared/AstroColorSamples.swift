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
    
    static var coreTertiary:ColorSample = ColorSample(name: "Astro UI Tertiary", color: Color.astroUITertiary, colorVariants: [
        ColorSample(name:"Astro UI Tertiary", color: Color.astroUITertiary),
        ColorSample(name:"Astro UI Tertiary Darken 1", color: Color.astroUITertiaryDarken1),
        ColorSample(name:"Astro UI Tertiary Darken 2", color: Color.astroUITertiaryDarken2),
        ColorSample(name:"Astro UI Tertiary Darken 3", color: Color.astroUITertiaryDarken3),
        ColorSample(name:"Astro UI Tertiary Darken 4", color: Color.astroUITertiaryDarken4),
        ColorSample(name:"Astro UI Tertiary Lighten 1", color: Color.astroUITertiaryLighten1),
        ColorSample(name:"Astro UI Tertiary Lighten 2", color: Color.astroUITertiaryLighten2),
        ColorSample(name:"Astro UI Tertiary Lighten 3", color: Color.astroUITertiaryLighten3),
        ColorSample(name:"Astro UI Tertiary Lighten 4", color: Color.astroUISecondaryLighten4)
    ])

    static var coreQuaternary:ColorSample = ColorSample(name: "Astro UI Quaternary", color: Color.astroUIQuaternary, colorVariants: [
        ColorSample(name:"Astro UI Quaternary", color: Color.astroUIQuaternary),
        ColorSample(name:"Astro UI Quaternary Darken 1", color: Color.astroUIQuaternaryDarken1),
        ColorSample(name:"Astro UI Quaternary Darken 2", color: Color.astroUIQuaternaryDarken2),
        ColorSample(name:"Astro UI Quaternary Darken 3", color: Color.astroUIQuaternaryDarken3),
        ColorSample(name:"Astro UI Quaternary Darken 4", color: Color.astroUIQuaternaryDarken4),
        ColorSample(name:"Astro UI Quaternary Lighten 1", color: Color.astroUIQuaternaryLighten1),
        ColorSample(name:"Astro UI Quaternary Lighten 2", color: Color.astroUIQuaternaryLighten2),
        ColorSample(name:"Astro UI Quaternary Lighten 3", color: Color.astroUIQuaternaryLighten3),
        ColorSample(name:"Astro UI Quaternary Lighten 4", color: Color.astroUISecondaryLighten4)
    ])

    static var astroUI:ColorSample = ColorSample(name: "Astro Core", color: Color.astroUIPrimary, colorVariants: [
        corePrimary,
        coreSecondary,
        coreTertiary,
        coreQuaternary
    ])

}
