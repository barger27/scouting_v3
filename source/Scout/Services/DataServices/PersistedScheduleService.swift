//
//  ScoutScheduleService.swift
//  Scout
//
//  Created by Ryan Barger on 6/3/22.
//

import Foundation

class DataScheduleService : ScheduleServiceProtocol {
    let _weatherService:WeatherServiceProtocol
    let _scheduleRepository:ScheduleRepositoryProtocol
    
    
    init(weatherService:WeatherServiceProtocol, scheduleRepository:ScheduleRepositoryProtocol) {
        self._weatherService = weatherService
        self._scheduleRepository = scheduleRepository
    }
    
    
    func getScheduleForDays(startDate: Date, numberOfDays: Int) -> [DayPlanner] {
        var dayPlanner:[DayPlanner] = []
        let beginDate = startDate.dateBySet(hour: 0, min: 0, secs: 0)!
        let endDate = startDate.dateByAdding(numberOfDays-1, .day).date
        let weather = _weatherService.getWeatherForDateRange(startDate: startDate, endDate: endDate)
        
        for dayIndex in 0 ..< numberOfDays {
            let thisDate = beginDate.dateByAdding(dayIndex, .day).date
            let forecast = weather[ thisDate ] ?? Weather(date: thisDate)
            
            dayPlanner.append(DayPlanner(day: thisDate,
                                         primaryTeam: nil,
                                         awayTeam: nil,
                                         tournament: nil,
                                         startTime: nil,
                                         location: nil,
                                         weather: forecast))
        }
        
        return dayPlanner
    }
}
