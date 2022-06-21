//
//  ScoutScheduleService.swift
//  Scout
//
//  Created by Ryan Barger on 6/3/22.
//

import Foundation

class DataScheduleService : ScheduleServiceProtocol {
    let _scheduleRepository:ScheduleRepositoryProtocol
    
    
    init(scheduleRepository:ScheduleRepositoryProtocol) {
        self._scheduleRepository = scheduleRepository
    }
    
    
    func getScheduleForDays(startDate: Date, numberOfDays: Int) async throws -> [DayPlanner] {
        let beginDate = startDate.dateBySet(hour: 0, min: 0, secs: 0)!
        let endDate = startDate.dateByAdding(numberOfDays-1, .day).date
        
        let planner = try await _scheduleRepository.getSchedule(startDate: beginDate, endDate: endDate)
        
        return planner
    }
}
