//
//  ContentView.swift
//  Scout
//
//  Created by Ryan Barger on 5/23/22.
//

import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                ForEach ([ "Monday", "Tuesday", "Wednesday",
                           "Thursday", "Friday", "Saturday",
                           "Sunday" ], id: \.self) {
                    day in
                
                    VStack {
                        Text(day)
                        Text("Richmond U")
                        Text("NC State")
                        Text("3 PM")
                        HStack {
                            Text("Richmond, VA")
                            Spacer()
                            Text("80°")
                        }
                    }
                }
            }
            Text("Hello, world!")
                .padding()
            HStack {
                
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
