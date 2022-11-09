//
//  AccessibilityOverrides.swift
//  AstroSwiftSampler
//
//  Created by Jeff Hokit on 11/9/22.
//

import SwiftUI

class AccessiblyOverrides : ObservableObject {
    @Published var dynamicTypeSize: DynamicTypeSize = .large
    static let dynamicTypeSizeOverrideName = "DynamicTypeSizeOverride"

    public static func registerUserDefaults() {
        UserDefaults.standard.register(defaults: [
            dynamicTypeSizeOverrideName : DynamicTypeSize.large.intValue])

    }
    
    public func readUserDefaults() {
        // read from user defaults
        let intValue = UserDefaults.standard.integer(forKey: AccessiblyOverrides.dynamicTypeSizeOverrideName)
        self.dynamicTypeSize = DynamicTypeSize(intValue)
    }

    public func writeUserDefaults() {
        // write to user defaults
        UserDefaults.standard.setValue(self.dynamicTypeSize.intValue, forKey: AccessiblyOverrides.dynamicTypeSizeOverrideName)
    }

}


#if os(iOS)
// Reusable toolbar item with menu, for setting the dynamicTypeSize override
public struct AccessibilyToolbarContent: ToolbarContent  {
    var placement:ToolbarItemPlacement = .automatic
    @EnvironmentObject var accessiblyOverrides:AccessiblyOverrides

    public init(placement:ToolbarItemPlacement){
        self.placement = placement
    }
    
    public init(){
    }

    public var body: some ToolbarContent {
        ToolbarItem(placement: placement)  {
            Menu {
                Picker("Unused", selection: $accessiblyOverrides.dynamicTypeSize) {
                    ForEach(DynamicTypeSize.allCases) { value in
                        Text(value.name)
                    }
                }
            } label: {
                Image(systemName:"textformat.size")
            }
        }
    }
}
#endif
