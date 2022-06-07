//
//  DayPlanner.swift
//  Scout
//
//  Created by Ryan Barger on 5/24/22.
//

import Foundation


struct DayPlanner : Identifiable, Equatable, Hashable, Comparable {
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
    var weather:Weather?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(day)
    }
    
    static func == (lhs:DayPlanner, rhs:DayPlanner) -> Bool {
        return lhs.day == rhs.day
    }
    
    static func < (lhs:DayPlanner, rhs:DayPlanner) -> Bool {
        return lhs.day < rhs.day
    }
}
