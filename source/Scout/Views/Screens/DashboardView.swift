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
                    }.background(Color.random())
                        .frame(height: 150)
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


extension Double {
    static func random() -> Double {
        return Double(arc4random()) / Double(UInt32.max)
    }
}


extension Color {
    static func random() -> Color {
        return Color(RGBColorSpace.sRGB,
                     red: .random(),
                     green: .random(),
                     blue: .random(),
                     opacity: 1.0
        )
    }
}
