//
//  MockScheduleService.swift
//  ScoutTests
//
//  Created by Ryan Barger on 6/3/22.
//

import Foundation
import SwiftDate
@testable import Scout


class MockScheduleService : ScheduleServiceProtocol {
    private var _getWeeklyScheduleReturn:[DayPlanner] = []
    
    func setupGetWeeklySchedule(returnValue:[DayPlanner]) {
        _getWeeklyScheduleReturn = returnValue
    }
    
    func getScheduleForDays(startDate:Date, numberOfDays:Int) -> [DayPlanner] {
        if _getWeeklyScheduleReturn.count > 0 {
            return _getWeeklyScheduleReturn
        }
        
        var dayPlanners:[DayPlanner] = []
        
        for dayIndex in 0..<numberOfDays {
            if let date = Calendar.current.date(byAdding: .day, value: dayIndex, to: startDate) {
                let planner = DayPlanner(day: date,
                                         teams: [],
                                         players: [],
                                         tournament: nil,
                                         startTime:  nil,
                                         location: "")
                dayPlanners.append(planner)
            }
        }
        
        return dayPlanners
    }
}
