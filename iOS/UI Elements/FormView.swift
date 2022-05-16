//
//  FormView.swift
//  AstroSwiftSampler (iOS)
//
//  Created by rocketjeff on 4/29/22.
//

import SwiftUI

struct FormView: View {
    @State var name: String = ""
    @State var password: String = ""
    @State var toggleValue: Bool = true

    var body: some View {
        ZStack{
            Form{
                Section(header: Text("Text Fields"))
                {
                    TextField("Name", text: $name)
                    SecureField("Password", text: $password)
                }.listRowBackground(Color.astroUISecondaryGroupedBackground)
                
                Section(header: Text("Controls"))
                {
                    Toggle(isOn: $toggleValue) {
                        Text("Toggle")
                    }
                    
                }.listRowBackground(Color.astroUISecondaryGroupedBackground)
            }
            .background(Color.astroUIGroupedBackground) // set the background color for both sections
            .navigationBarTitle("Form")
            
        }
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .preferredColorScheme(.dark)
    }
}
