//
//  ContentView.swift
//  Shared
//
//  Created by rocketjeff on 1/13/22.
//

import SwiftUI

extension DynamicTypeSize:Identifiable {
    
    public var id: Self { self } // Add id and Identifiable conformance to use in ForEeach

    // DynamicTypeSize does not conform to RawRepresentable or Codable, so add functions to map to int for storage in UserDefaults
    
//    init(_ intValue:Int) {
//        switch intValue {
//        case 0:
//            self = .xSmall
//        case 1:
//            self = .small
//        case 2:
//            self = .medium
//        case 3:
//            self = .large
//        case 4:
//            self = .xLarge
//        case 5:
//            self = .xxLarge
//        case 6:
//            self = .xxxLarge
//        case 7:
//            self = .accessibility1
//        case 8:
//            self = .accessibility2
//        case 9:
//            self = .accessibility3
//        case 10:
//            self = .accessibility4
//        case 11:
//            self = .accessibility5
//        default:
//            self = .large
//        }
//    }
    
    init(_ intValue:Int) {
        let cases = Self.allCases
        self = cases[intValue]
    }
    
    var intValueShort:Int{
        let cases = Self.allCases
        return cases.firstIndex(of: self)!
    }

    
//    var intValue:Int{
//        switch self {
//        case .xSmall:
//             return 0
//        case .small:
//            return 1
//        case .medium:
//            return 2
//        case .large:
//            return 3
//        case .xLarge:
//            return 4
//        case .xxLarge:
//            return 5
//        case .xxxLarge:
//            return 6
//        case .accessibility1:
//            return 7
//        case .accessibility2:
//            return 8
//        case .accessibility3:
//            return 9
//        case .accessibility4:
//            return 10
//        case .accessibility5:
//            return 11
//        @unknown default:
//            return 0
//        }
//    }

    // add a name so DynamicTypeSize can be used in menus
    var name:String{
        return "\(self)"
    //    return String(reflecting:self)
//        switch self {
//        case .xSmall:
//            return "xSmall"
//        case .small:
//            return "small"
//        case .medium:
//            return "medium"
//        case .large:
//            return "large"
//        case .xLarge:
//            return "xLarge"
//        case .xxLarge:
//            return "xxLarge"
//        case .xxxLarge:
//            return "xxxLarge"
//        case .accessibility1:
//            return "accessibility1"
//        case .accessibility2:
//            return "accessibility2"
//        case .accessibility3:
//            return "accessibility3"
//        case .accessibility4:
//            return "accessibility4"
//        case .accessibility5:
//            return "accessibility5"
//        @unknown default:
//            return "unknown"
//        }
    }
}

class AccessiblyOverrides : ObservableObject {
  @Published var dynamicTypeSize: DynamicTypeSize = .large
}


struct ContentView: View {
    @StateObject var accessiblyOverrides = AccessiblyOverrides()

    var body: some View {
        TabView {
            Components()
            Colors()
            Symbols()
        }
        .environmentObject(accessiblyOverrides) // injected in the environment
        .dynamicTypeSize(accessiblyOverrides.dynamicTypeSize)
        .onAppear(){
            // read from user defaults
            let intValue = UserDefaults.standard.integer(forKey: dynamicTypeSizeOverrideName)
            accessiblyOverrides.dynamicTypeSize = DynamicTypeSize(intValue)
        }
        .onDisappear(){
            // write to user defaults
            UserDefaults.standard.setValue(accessiblyOverrides.dynamicTypeSize.intValueShort, forKey: dynamicTypeSizeOverrideName)
        }
    }
}

public let dynamicTypeSizeOverrideName = "DynamicTypeSizeOverride"

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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}


