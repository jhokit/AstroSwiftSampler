//
//  UIElements.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 5/13/22.
//

import SwiftUI
import AstroSwiftFoundation
import AstroSwiftUtilities

struct Components: View {
    
    @State private var isShowingAlert = false
    @State var someSize:DynamicTypeSize = .large
    
    var body: some View {

        NavigationSplitView{
            Form {
                AstroComponents()
                
                SystemComponents(isShowingAlert: $isShowingAlert)
                
                Lists()
                
                // show the app version in a section
                Section(){
                    Text(versionString())
                }.listRowBackground(Color.astroUISecondaryGroupedBackground)
            }
            .toolbar{
                AccessibilyToolbarContent()
            }
            // set the background color for all sections
            .background(Color.astroUIGroupedBackground)
            .scrollContentBackground(.hidden) // required on iOS 16 to let background color show
            .navigationBarTitle("Components")
        } detail: {
            PlainList() // show this by default
            // all other detail views are pushed directly by NavigationLink(s)
        }
        .tabItem {
            Image(systemName: "switch.2")
            Text("Components")
        }
        .alert("Sample Alert", isPresented: $isShowingAlert) {
            Button("Continue", role: .cancel) {}
        } message: {
            Text("Hello")
        }
    }
}

struct StatusSymbols: View {
    var body: some View {
        ViewThatFits(){
            // horizontal row of status symbols
            HStack{
                Text("Status")
                Spacer()
                Status(AstroStatus.off)
                Status(AstroStatus.standby)
                Status(AstroStatus.normal)
                Status(AstroStatus.caution)
                Status(AstroStatus.serious)
                Status(AstroStatus.critical)
            }
            // Vertical column of status symbols
            VStack{
                Text("Status")
                Spacer()
                Status(AstroStatus.off)
                Status(AstroStatus.standby)
                Status(AstroStatus.normal)
                Status(AstroStatus.caution)
                Status(AstroStatus.serious)
                Status(AstroStatus.critical)
            }
        }
    }
}

struct StatusTags: View {
    var body: some View {
        let columns:[GridItem] = [GridItem(.flexible(),alignment: .trailing), GridItem(.flexible(),alignment: .trailing)]
        
        // two columns of status tags
        VStack{
            HStack{
                Text("Status Tag")
                Spacer()
            }
            LazyVGrid(columns:columns) {
                Tag(text:AstroStatus.off.description,status: .off)
                Tag(text:AstroStatus.standby.description,status: .standby)
                Tag(text:AstroStatus.caution.description,status: .caution)
                Tag(text:AstroStatus.normal.description,status: .normal)
                Tag(text:AstroStatus.serious.description,status: .serious)
                Tag(text:AstroStatus.critical.description,status: .critical)
            }
        }
    }
}

struct NonStatusTags: View {
    var body: some View {
        // single non-status tag
        HStack{
            Text("Tag")
            Spacer()
            Tag(text:"Hello")
        }
    }
}

struct ClassificationBanners: View {
    var body: some View {
        // full width stack of classification banners
        VStack{
            HStack{
                Text("Classification Banner")
                Spacer()
            }
            ClassificationBanner(.unclassified)
            ClassificationBanner(.cui)
            ClassificationBanner(.confidential)
            ClassificationBanner(.secret)
            ClassificationBanner(.topSecret)
            ClassificationBanner(.topSecretSCI)
        }
        
    }
}


private struct ClassificationMarkers: View {
    var body: some View {
        let columns:[GridItem] = [GridItem(.flexible(),alignment: .trailing), GridItem(.flexible(),alignment: .trailing)]
        
        // two columns of classification markers
        VStack{
            HStack{
                Text("Classification Marker")
                Spacer()
            }
            LazyVGrid(columns:columns) {
                ClassificationMarker(.unclassified)
                ClassificationMarker(.cui)
                ClassificationMarker(.confidential)
                ClassificationMarker(.secret)
                ClassificationMarker(.topSecret)
                ClassificationMarker(.topSecretSCI)
            }
        }
    }
}

struct Clocks: View {
    var body: some View {
        // full width stack of clocks
        VStack(spacing:4){
            HStack{
                Text("Clock")
                Spacer()
            }
            // standard Astro Clock, equivalent to AstroClock(verbatimFormatter: AstroClock.astroDayTime)
            AstroClock()

            // standard Astro Clock, without day of year
            AstroClock(verbatimFormatter: AstroClock.astroTime)

            // 24 hour clock with 'Z' time zone suffix.
            AstroClock(verbatimFormatter: Date.VerbatimFormatStyle(format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits) Z", locale: .current,timeZone: TimeZone.gmt, calendar: .current))
            
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

        }
    }
}

struct IntervalTimers: View {
    var body: some View {
        // full width stack of clocks
        VStack(){
            HStack{
                Text("Interval Timer")
                Spacer()
            }
            HStack{
                Spacer()
                VStack(alignment: .trailing, spacing:4){
                    IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), options: .all)
                    IntervalTimer(targetDate: Date(), options: [.hour,.minute,.second]).foregroundColor(.mint)
                    IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), formatter:(Date.IntervalFormatStyle()))
                }
                Spacer()
            }

        }
    }
}

struct AstroComponents: View {
    
    var body: some View {
        Section("Astro Components"){
            StatusSymbols()
            
            StatusTags()
            
            NonStatusTags()
            
            Clocks()
            
            IntervalTimers()
            
            ClassificationBanners()
            
            ClassificationMarkers()
            
        }.listRowBackground(Color.astroUISecondaryGroupedBackground)
    }
}

struct SystemComponents: View {
    @State var toggleValue: Bool = true
    @State private var sliderValue: Double = 100
    @ObservedObject private var fruits = Fruits()
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5
    @Binding var isShowingAlert:Bool
    
    var body: some View {
        Section("System Components"){
            // Toggle
            Toggle(isOn: $toggleValue) {
                Text("Toggle")
            }
            
            // Slider
            Slider(value: $sliderValue, in: 0...200) {
                Text("Slider")
            } minimumValueLabel: {
                Image(systemName: "tortoise")
            } maximumValueLabel: {
                Image(systemName: "hare")
            }
            
            // Two kinds of progress
            ProgressView("Progress", value: progressValue, total: progressTotal)
            ProgressView() // This view often dissapears when scrolled offscreen and back onscreen
            
            // Link
            Link("External Link", destination: URL(string: "https://www.astrouxds.com")!)
            
            // Menu
            Menu("Menu") {
                ForEach(fruits.fruits){ fruit in
                    Button(fruit.name) {}
                }
            }
            
            // Button
            Button(LocalizedStringKey("Show Alert")) {
                isShowingAlert = true
            }
        }.listRowBackground(Color.astroUISecondaryGroupedBackground)
    }
}

struct Lists: View {
    var body: some View {
        Section("Lists"){
            // Note that iOS, unlike macOS, automatically handles selection.
            // On iPad in split view mode,iOS 16 and later, it does show a persistent selection.
            // If the background color has been set, as we do below with .listRowBackground,
            // iPadOS shows the selection as a frame around the row in AccentColor.
            // (If the background color is not set, selection is shown by inverting the row in AccentColor).
            List(){
                NavigationLink("Plain") {
                    PlainList()
                }
                NavigationLink("Grouped") {
                    GroupedList()
                }
                NavigationLink("Inset") {
                    InsetList()
                }
                NavigationLink("Inset Grouped") {
                    InsetGroupedList()
                }
                NavigationLink("Form") {
                    FormView()
                }
            }.listRowBackground(Color.astroUISecondaryGroupedBackground)
        }
    }
}

//// showing the entire view causes simulator to crash
struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Clocks()
            IntervalTimers()

    }
}

