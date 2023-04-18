//
//  UIElements.swift
//  AstroSwiftSampler (macOS)
//
//  Created by rocketjeff on 5/24/22.
//

import SwiftUI
import AstroSwiftFoundation
import AstroSwiftUtilities

let radius = 6.0
struct Components: View {
    
    @State private var isShowingAlert = false

    var body: some View {
        ScrollView{
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 400))]){// as many 300 width columns as will fit
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
                    Section{
                        HStack(alignment: .center){
                            Text(versionString()).padding()
                        }
                    }
                }
                .padding()
        }
        .background(Color.astroUIBackground) // Set the background color for the whole page
        .navigationTitle("Components")
    
        .alert("Sample Alert", isPresented: $isShowingAlert) {
            Button("Continue", role: .cancel) {}
        } message: {
            Text("Hello")
        }

    }
}




struct ToggleSample: View {
    @State var toggleValue: Bool = true

    var body: some View {
        VStack(alignment: .leading){
                Text("Toggle").font(.subheadline)
            HStack{
                Toggle(isOn: $toggleValue) {
                    Text("Value")
                }
                Spacer()
            }
        }.padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)
        
    }
}

struct Progress: View {
    @State private var progressValue: Double = 3
    let progressTotal:Double = 5

    var body: some View{
        // Two kinds of progress
        VStack(alignment: .leading){
            
                Text("Progress").font(.subheadline)
            ProgressView("Determinate", value: progressValue, total: progressTotal)
            ProgressView().padding(.bottom, 8)
        }.padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)
        
    }
}

            
struct ExternalLink: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("External Link").font(.subheadline)
                Spacer()
            }.padding(.bottom,4)
            Link("Astro Web Site", destination: URL(string: "https://www.astrouxds.com")!)
        }.padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)
        
    }
}

struct ButtonAndAlert: View {
    @Binding var isShowingAlert:Bool
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                Text("Button and Alert").font(.subheadline)
                Spacer()
            }.padding(.bottom,4)
            Button(LocalizedStringKey("Show Alert")) {
                isShowingAlert = true
            }
        }.padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)
    }
}
    
struct StatusSymbols: View {
    var body: some View {
        VStack(alignment: .center){
            HStack{
                Text("Status").font(.subheadline)
                Spacer()
            }
            HStack(alignment: .center){
                Status(AstroStatus.off)
                Status(AstroStatus.standby)
                Status(AstroStatus.normal)
                Status(AstroStatus.caution)
                Status(AstroStatus.serious)
                Status(AstroStatus.critical)
            }
        }.padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)
    }
}

struct Clocks: View {
    var body: some View {
        VStack(alignment: .leading, spacing:6){
            HStack{
                Text("Clock").font(.subheadline)
                Spacer()
            }.padding(.bottom,4)
            // standard Astro Clock, equivalent to AstroClock(verbatimFormatter: AstroClock.astroDayTime)
            HStack{
                Spacer()
                VStack(alignment: .center, spacing:6){
                    
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
                }
                Spacer()
            }
        }
        .padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)
    }

}

struct Timers: View {
    var body: some View {
        VStack(alignment: .center){
            HStack{
                Text("Interval Timer").font(.subheadline)
                Spacer()
            }.padding(.bottom,4)
                    IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), options: .all)
                    IntervalTimer(targetDate: Date(), options: [.hour,.minute,.second]).foregroundColor(.mint)
                    IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), formatter:(Date.IntervalFormatStyle()))
        }
        .padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)

    }
}

struct StatusTags: View {
    var body: some View {
        VStack(alignment: .center){
            HStack{
                Text("Status Tag").font(.subheadline)
                Spacer()
            }
            HStack(){
                Tag(text:AstroStatus.off.description,status: .off)
                Tag(text:AstroStatus.standby.description,status: .standby)
                Tag(text:AstroStatus.caution.description,status: .caution)
                Tag(text:AstroStatus.normal.description,status: .normal)
                Tag(text:AstroStatus.serious.description,status: .serious)
                Tag(text:AstroStatus.critical.description,status: .critical)
            }
        }
        .padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)
    }
}


struct Tags: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Tag").font(.subheadline)
            HStack(alignment: .center){
                Tag(text:"Hello")
                Spacer()
            }
        }
        .padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)
    }
}

struct ClassificationBanners: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Classification Banner").font(.subheadline)
            
                ClassificationBanner(.unclassified)
                ClassificationBanner(.cui)
                ClassificationBanner(.confidential)
                ClassificationBanner(.secret)
                ClassificationBanner(.topSecret)
                ClassificationBanner(.topSecretSCI)
            }
            .padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)
    }
}


struct ClassificationMarkers: View {
    var body: some View {
        VStack{
            HStack{
                Text("Classification Marker").font(.subheadline)
                Spacer()
            }
            HStack(){
                ClassificationMarker(.unclassified)
                ClassificationMarker(.cui)
                ClassificationMarker(.confidential)
                ClassificationMarker(.secret)
                ClassificationMarker(.topSecret)
                ClassificationMarker(.topSecretSCI)
            }
        }
        .padding().background(Color.astroUISecondaryBackground).cornerRadius(radius)

        
    }
}


//// showing the entire view causes simulator to crash
struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Clocks()
    }
}
