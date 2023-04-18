//
//  UIElements.swift
//  AstroSwiftSampler (macOS)
//
//  Created by rocketjeff on 5/24/22.
//

import SwiftUI
import AstroSwiftFoundation
import AstroSwiftUtilities

struct Components: View {
    
    @State private var isShowingAlert = false
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 400))]){// as many 400 width columns as will fit
                Section("Astro Components"){
                    StatusSymbols()
                    StatusTags()
                    Tags()
                    Clocks()
                    Timers()
                    ClassificationBanners()
                    ClassificationMarkers()
                }
                Section("System Components"){
                    ToggleSample()
                    Progress()
                    ExternalLink()
                    ButtonAndAlert(isShowingAlert: $isShowingAlert)
                }
            }
            .padding()
            
            HStack(alignment: .center){ // verson centered at the bottom
                Text(versionString())
            }
        }
        .background(Color.astroUIBackground) // Set the background color for the whole page
        .navigationTitle("Components")
        
        .alert("Sample Alert", isPresented: $isShowingAlert) { // handle the alert
            Button("Continue", role: .cancel) {}
        } message: {
            Text("Hello")
        }
    }
}

// left justified tile title
struct TileTitle: View {
    var name: String
    
    var body: some View {
        HStack{
            Text(name).font(.subheadline)
            Spacer()
        }.padding(.bottom,4)
    }
}

// rounded filled tile
extension View {
    public func tileStyle() -> some View {
        return self
            .padding()
            .background(Color.astroUISecondaryBackground)
            .cornerRadius(6)
    }
}

struct ToggleSample: View { // called Tottle Sample because Toggle is taken
    @State var toggleValue: Bool = true
    
    var body: some View {
        VStack(alignment: .center){
            TileTitle(name: "Toggle")
            Toggle(isOn: $toggleValue) {
                Text("Value")
            }
        }.tileStyle()
    }
}

struct Progress: View {
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5
    
    var body: some View{
        // Two kinds of progress
        VStack(alignment: .center){
            TileTitle(name: "Progress")
            ProgressView("Determinite", value: progressValue, total: progressTotal)
            ProgressView()
        }.tileStyle()
    }
}


struct ExternalLink: View {
    var body: some View {
        VStack(alignment: .center){
            TileTitle(name: "External Link")
            Link("Astro Web Site", destination: URL(string: "https://www.astrouxds.com")!)
        }.tileStyle()
    }
}

struct ButtonAndAlert: View {
    @Binding var isShowingAlert:Bool
    var body: some View {
        VStack(alignment: .center){
            TileTitle(name: "Button and Alert")
            Button(LocalizedStringKey("Show Alert")) {
                isShowingAlert = true
            }
        }.tileStyle()
    }
}

struct StatusSymbols: View {
    var body: some View {
        VStack(alignment: .center){
            TileTitle(name: "Status")
            HStack(){
                Status(AstroStatus.off)
                Status(AstroStatus.standby)
                Status(AstroStatus.normal)
                Status(AstroStatus.caution)
                Status(AstroStatus.serious)
                Status(AstroStatus.critical)
            }
        }.tileStyle()
    }
}

struct Clocks: View {
    var body: some View {
        VStack(alignment: .center,spacing: 6){
            TileTitle(name: "Clock")
            // standard Astro Clock, equivalent to AstroClock(verbatimFormatter: AstroClock.astroDayTime)
            
            // standard Astro Clock, without day of year
            AstroClock(verbatimFormatter: AstroClock.astroTime)
            
            // standard Astro Clock, with day of year and UTC suffix
            AstroClock(verbatimFormatter: AstroClock.astroDayTime, suffix: " UTC")
            
            // standard system day and time format
            AstroClock(formatter: Date.FormatStyle())
            
            // customized system clock, in French
            AstroClock(formatter: Date.FormatStyle()
                .year(.defaultDigits)
                .month(.abbreviated)
                .day(.twoDigits)
                .hour(.defaultDigits(amPM: .abbreviated))
                .minute(.twoDigits)
                .timeZone(.exemplarLocation)
                .weekday(.wide)
                .locale(.init(identifier: "fr_FR")),
                       textStyle: .caption)
            .foregroundColor(.mint)
            
            // customized system clock, in English
            AstroClock(formatter: Date.FormatStyle()
                .year(.defaultDigits)
                .month(.abbreviated)
                .day(.twoDigits)
                .hour(.defaultDigits(amPM: .abbreviated))
                .minute(.twoDigits)
                .second(.twoDigits)
                .timeZone(.exemplarLocation)
                .weekday(.wide),
                       textStyle: .caption)
        }.tileStyle()
    }
}

struct Timers: View {
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            TileTitle(name: "Interval Timer")
            IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), options: .all)
            IntervalTimer(targetDate: Date(), options: [.hour,.minute,.second]).foregroundColor(.mint)
            IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), formatter:(Date.IntervalFormatStyle()))
        }.tileStyle()
    }
}

struct StatusTags: View {
    var body: some View {
        VStack(alignment: .center){
            TileTitle(name: "Status Tag")
            HStack(){
                Tag(text:AstroStatus.off.description,status: .off)
                Tag(text:AstroStatus.standby.description,status: .standby)
                Tag(text:AstroStatus.caution.description,status: .caution)
                Tag(text:AstroStatus.normal.description,status: .normal)
                Tag(text:AstroStatus.serious.description,status: .serious)
                Tag(text:AstroStatus.critical.description,status: .critical)
            }
        }.tileStyle()
    }
}

struct Tags: View {
    var body: some View {
        VStack(alignment: .center){
            TileTitle(name: "Tag")
            Tag(text:"Hello")
        }.tileStyle()
    }
}

struct ClassificationBanners: View {
    var body: some View {
        VStack(alignment: .center){
            TileTitle(name: "Classification Banner")
            ClassificationBanner(.unclassified)
            ClassificationBanner(.cui)
            ClassificationBanner(.confidential)
            ClassificationBanner(.secret)
            ClassificationBanner(.topSecret)
            ClassificationBanner(.topSecretSCI)
        }.tileStyle()
    }
}

struct ClassificationMarkers: View {
    var body: some View {
        VStack(alignment: .center){
            TileTitle(name: "Classification Marker")
            HStack{
                ClassificationMarker(.unclassified)
                ClassificationMarker(.cui)
                ClassificationMarker(.confidential)
                ClassificationMarker(.secret)
                ClassificationMarker(.topSecret)
                ClassificationMarker(.topSecretSCI)
            }
        }.tileStyle()
    }
}

//// showing the entire view causes simulator to crash
struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Clocks()
    }
}
