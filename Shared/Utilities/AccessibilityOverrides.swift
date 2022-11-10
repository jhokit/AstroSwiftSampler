//
//  AccessibilityOverrides.swift
//  AstroSwiftSampler
//
//  Created by Jeff Hokit on 11/9/22.
//

import SwiftUI

class AccessiblyOverrides : ObservableObject {
    @Published var dynamicTypeSize: DynamicTypeSize = .large
    @Published var accessibilityBoldWeight:LegibilityWeight = .regular
    
    static let dynamicTypeSizeOverrideName = "DynamicTypeSizeOverride"
    static let accessibilityBoldOverrideName = "AccessibilityBoldOverride"

    public static func registerUserDefaults() {
        UserDefaults.standard.register(defaults: [
            accessibilityBoldOverrideName : LegibilityWeight.regular.intValue,
            dynamicTypeSizeOverrideName : DynamicTypeSize.large.intValue])

    }
    
    public func readUserDefaults() {
        // read from user defaults
        var intValue = UserDefaults.standard.integer(forKey: AccessiblyOverrides.dynamicTypeSizeOverrideName)
        self.dynamicTypeSize = DynamicTypeSize(intValue)
        
        intValue = UserDefaults.standard.integer(forKey: AccessiblyOverrides.accessibilityBoldOverrideName)
        self.accessibilityBoldWeight = LegibilityWeight(intValue)
    }

    public func writeUserDefaults() {
        // write to user defaults
        UserDefaults.standard.setValue(self.dynamicTypeSize.intValue, forKey: AccessiblyOverrides.dynamicTypeSizeOverrideName)
        UserDefaults.standard.setValue(self.accessibilityBoldWeight.intValue, forKey: AccessiblyOverrides.accessibilityBoldOverrideName)

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
        
        ToolbarItem(placement: placement)  {
            Menu {
                Picker("Unused", selection: $accessiblyOverrides.accessibilityBoldWeight) {
                    
                    ForEach(LegibilityWeight.allCases) { value in
                        Text(value.name)
                    }
                }
            } label: {
                Image(systemName:"bold")
            }
        }
    }
}
#endif
