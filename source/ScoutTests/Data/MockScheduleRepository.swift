//
//  MockScheduleRepository.swift
//  ScoutTests
//
//  Created by Ryan Barger on 6/7/22.
//

import Foundation
@testable import Scout

class MockScheduleRepository : ScheduleRepositoryProtocol {
    func getSchedule(startDate:Date, endDate:Date) async throws -> [DayPlanner] {
        try await Task.sleep(nanoseconds: 10)
        var dayPlanners:[DayPlanner] = []
        var date = startDate
        
        while date <= endDate {
            let dayPlanner = DayPlanner(day: date,
                                        teams: [],
                                        players: [],
                                        tournament: nil,
                                        startTime: nil,
                                        location: nil)
            dayPlanners.append(dayPlanner)
            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        }
        
        return dayPlanners
    }
}
