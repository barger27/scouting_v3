//
//  DayPlanner.swift
//  Scout
//
//  Created by Ryan Barger on 5/24/22.
//

import Foundation


struct DayPlanner : Identifiable {
    var id: Date {
        get {
            return day
        }
    }
    
    var day:Date
    var primaryTeam:Team?
    var awayTeam:Team?
    var tournament:String?
    var startTime:Date?
    var location:String?
    var weatherIcon:WeatherIcon?
    var temperature:Int?
}
