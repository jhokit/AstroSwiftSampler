//
//  Astro_Swift_SamplerTests.swift
//  Astro Swift SamplerTests
//
//  Created by rocketjeff on 5/24/22.
//

import XCTest
import AstroSwiftFoundation
import AstroSwiftCore
import SwiftUI

@testable import Astro_Sampler // This is the Product Name in iOS target settings

class Astro_Swift_SamplerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Look for colors with zero RGB components (white). This happens when the Color does not load from resources.
    func testColorsForZeroComponents()
    {
        findColorsWithZeroComponents(AstroColorSamples.astroStatus)
        findColorsWithZeroComponents(AstroColorSamples.astroClassification)
        findColorsWithZeroComponents(AstroColorSamples.astroCore)
        // cannot test astroSemantic because it contains intentional zero (white) colors
    }
    
    // Look for colors with zero RGB components (white) in a set of ColorSamples
    func findColorsWithZeroComponents(_ sample:ColorSample)   {
        var colorDictionary = Set<[CGFloat]>()

        for colorSample in sample.colorVariants!{
            if let subVariants = colorSample.colorVariants
            {
                for subVariant in subVariants
                {
                    let components = UIColor(subVariant.color).cgColor.components!
                    let total = components.reduce(0, +)
                    XCTAssertTrue(total > 0.0, "zero color found named \(subVariant.name)")
                    //print("testing subvariant for zero \(subVariant.name)")
                }
            }
            else {
                let components = UIColor(colorSample.color).cgColor.components!
                let result = colorDictionary.insert(components)
                XCTAssertTrue(result.inserted, "zero color found named \(colorSample.name)")
                //print("testing for zero \(colorSample.name)")
            }
        }
    }


    // Look for duplicates in a set of ColorSamples
    func testColorsForDuplicates()  {
        findDuplicateColors(AstroColorSamples.astroStatus)
        findDuplicateColors(AstroColorSamples.astroClassification)
        findDuplicateColors(AstroColorSamples.astroCore)
        // cannot test astroSemantic because it contains intentional duplicates
    }
    
    // Look for duplicates in a set of ColorSamples by attempting to add their color components (an array of CGFloats)
    // to a Set. Set.insert hashes the array, and will return result == false if an identical hash is found
    func findDuplicateColors(_ sample:ColorSample)   {
        var colorDictionary = Set<[CGFloat]>()

        for colorSample in sample.colorVariants!{
            if let subVariants = colorSample.colorVariants
            {
                for subVariant in subVariants
                {
                    let components = UIColor(subVariant.color).cgColor.components!
                    let result = colorDictionary.insert(components)
                    XCTAssertTrue(result.inserted, "duplicate color found named \(subVariant.name)")
                    print("testing subvariant \(subVariant.name)")
                }
            }
            else {
                let components = UIColor(colorSample.color).cgColor.components!
                let result = colorDictionary.insert(components)
                XCTAssertTrue(result.inserted, "duplicate color found named \(colorSample.name)")
                print("testing \(colorSample.name)")
            }
        }
    }
    
    
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
