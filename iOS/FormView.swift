//
//  FormView.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct FormView: View {
    @Environment(\.colorScheme) var colorScheme

    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var enrolled: Bool = false
    @State var notifications: Bool = true

    var body: some View {
        Form{
            Section(header: Text("Name"))
            {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
            }.listRowBackground(Color.astroUISecondaryGroupedBackground(colorScheme)) // applying this to the Group doesn't work
            
            Section(header: Text("Options"), footer: notifications ? Text("Notification will be sent by email"):Text(""))
            {
                Toggle(isOn: $enrolled) {
                    Text("Enrolled")
                }
                Toggle(isOn: $notifications) {
                    Text("Notifications")
                }
            }.listRowBackground(Color.astroUISecondaryGroupedBackground(colorScheme)) // applying this to the Group doesn't work
        }
        .background(Color.astroUIGroupedBackground(colorScheme)) // set the background color for both Lists
        .navigationBarTitle("Form")
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
