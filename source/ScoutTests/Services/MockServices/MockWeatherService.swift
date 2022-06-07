//
//  MockWeatherService.swift
//  ScoutTests
//
//  Created by Ryan Barger on 6/6/22.
//

import Foundation
@testable import Scout

class MockWeatherService : WeatherServiceProtocol {
    var weatherByDate: [ Date : Weather] = [ : ]
    
    func setWeatherForDate(date:Date, temp:Int, icon: WeatherIcon) {
        let dateAtMidnight = date.dateBySet(hour: 0, min: 0, secs: 0)!
        weatherByDate[dateAtMidnight] = Weather(date: dateAtMidnight,
                                                weatherType: .daily,
                                                temperature: temp,
                                                weatherIcon: icon)
    }
    
    
    func getWeatherForDateRange(startDate: Date, endDate: Date) -> [ Date : Weather ]{
        var weatherData:[ Date : Weather ] = [ : ]
        var date = startDate.dateBySet(hour: 0, min: 0, secs: 0)!
        
        while (date <= endDate) {
            if let weather = weatherByDate[date] {
                weatherData[ date ] = weather
            } else {
                weatherData[ date ] = Weather(date: date)
            }
            
            date = date.dateByAdding(1, .day).date
        }
        
        return weatherData
    }
}
