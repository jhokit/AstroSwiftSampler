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
    @State var toggleValue: Bool = true
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5
    @State private var isShowingAlert = false
    
    var body: some View {
        ScrollView{
            VStack {
                Text("Astro Components").font(.headline).padding(.top,10)
                Form {
                    // Astro Components
                    VStack(alignment: .leading,spacing:15){
                        StatusSymbols()
                        
                        StatusTags()

                        Tags()

                        Clocks()

                        Timers()

                        ClassificationBanners()
                        
                        ClassificationMarkers()
                    }
                }
                .padding()
                Divider()
               
                // System Components
                Text("System Components").font(.headline).padding(.top,2)

                Form(){

                    // Toggle
                    Toggle(isOn: $toggleValue) {
                        Text("Toggle")
                    }
                    
                    // Two kinds of progress
                    ProgressView("Progress", value: progressValue, total: progressTotal)
                    ProgressView().padding(.bottom, 8)
                    
                    // Link
                    Link("External Link", destination: URL(string: "https://www.astrouxds.com")!)
                    
                    
                    // Button and Alert
                    Button(LocalizedStringKey("Show Alert")) {
                        isShowingAlert = true
                    }
                    
                }.padding()
                    .alert("Sample Alert", isPresented: $isShowingAlert) {
                        Button("Continue", role: .cancel) {}
                    } message: {
                        Text("Hello")
                    }
                
                Divider()
                HStack{
                    Text(versionString()).padding()
                    Spacer()
                }
                Spacer()
            }
        }
        .background(Color.astroUIBackground) // Set the background color for the whole page
        .navigationTitle("Components")

    }
}

struct StatusSymbols: View {
    var body: some View {
        Text("Status")
        HStack{
            Status(AstroStatus.off)
            Status(AstroStatus.standby)
            Status(AstroStatus.normal)
            Status(AstroStatus.caution)
            Status(AstroStatus.serious)
            Status(AstroStatus.critical)
            Spacer()
        }
        Divider()
    }
}

struct Clocks: View {
    var body: some View {
        VStack(alignment: .leading, spacing:6){
            HStack{
                Text("Clock")
                Spacer()
            }.padding(.bottom,4)
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
                       digitFont:Font.system(.caption))
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
                       digitFont:Font.system(.caption))
           /* .foregroundColor(.teal)*/.monospacedDigit()

        }
        Divider()
    }

}

struct Timers: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Interval Timer")
                Spacer()
            }.padding(.bottom,4)
            VStack(alignment: .trailing, spacing:6) {
                IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), options: .all)
                IntervalTimer(targetDate: Date(), options: [.hour,.minute,.second]).foregroundColor(.mint)
                IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), formatter:(Date.IntervalFormatStyle()))
            }
        }
        Divider()

    }
}

struct StatusTags: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Status Tag")
            HStack(){
                Tag(text:AstroStatus.off.description,status: .off)
                Tag(text:AstroStatus.standby.description,status: .standby)
                Tag(text:AstroStatus.caution.description,status: .caution)
                Tag(text:AstroStatus.normal.description,status: .normal)
                Tag(text:AstroStatus.serious.description,status: .serious)
                Tag(text:AstroStatus.critical.description,status: .critical)
                Spacer()
            }
        }
        Divider()
    }
}


struct Tags: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Tag")
            HStack{
                Tag(text:"Hello")
                Spacer()
            }
        }
        Divider()
    }
}

struct ClassificationBanners: View {
    var body: some View {
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
        Divider()
    }
}


struct ClassificationMarkers: View {
    var body: some View {
        VStack{
            HStack{
                Text("Classification Marker")
                Spacer()
            }
            HStack(){
                ClassificationMarker(.unclassified)
                ClassificationMarker(.cui)
                ClassificationMarker(.confidential)
                ClassificationMarker(.secret)
                ClassificationMarker(.topSecret)
                ClassificationMarker(.topSecretSCI)
                Spacer()
            }
        }
    }
}


//// showing the entire view causes simulator to crash
struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Components()
    }
}
