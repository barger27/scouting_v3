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
    private let coreDataSource = InMemoryCoreDataSource()
    
    func setupGetWeeklySchedule(returnValue:[DayPlanner]) {
        _getWeeklyScheduleReturn = returnValue
    }
    
    func getScheduleForDays(startDate:Date, numberOfDays:Int) -> [DayPlanner] {
        let dataContext = coreDataSource.mainContext
        if _getWeeklyScheduleReturn.count > 0 {
            return _getWeeklyScheduleReturn
        }
        
        var dayPlanners:[DayPlanner] = []
        
        for dayIndex in 0..<numberOfDays {
            if let date = Calendar.current.date(byAdding: .day, value: dayIndex, to: startDate) {
                let planner = DayPlanner(context: dataContext)
                planner.day = date
                dayPlanners.append(planner)
            }
        }
        
        return dayPlanners
    }
}
