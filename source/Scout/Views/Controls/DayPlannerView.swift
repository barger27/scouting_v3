//
//  DayPlanner.swift
//  Scout
//
//  Created by Ryan Barger on 5/24/22.
//

import SwiftUI

struct DayPlannerView: View {
    var model:DayPlanner
    
    init(model: DayPlanner) {
        self.model = model
    }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


struct DayPlannerView_Previews: PreviewProvider {
    static let model = DayPlanner(
        day: Date(),
        primaryTeam: Team(name: "Indiana"),
        awayTeam: Team(name: "Purdue"),
        tournament: nil,
        startTime: Calendar.current.date(bySettingHour: 15, minute: 0, second: 0, of: Date())!,
        location: "Bloomington, IN",
        weatherIcon: WeatherIcon.sunny,
        temperature: 74
    )
    
    static var previews: some View {
        DayPlannerView(model: model)
    }
}
