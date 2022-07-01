//
//  Version.swift
//  AstroSwiftSampler
//
//  Created by rocketjeff on 7/1/22.
//

import Foundation

func versionString()->String
{
    let version:String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Unknown"
    let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "Unknown"
    return "Version " + version + " (" + build + ")"
}
