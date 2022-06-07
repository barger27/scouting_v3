//
//  PersistedScheduleServiceTest.swift
//  ScoutTests
//
//  Created by Ryan Barger on 6/6/22.
//

import Foundation
import XCTest
import SwiftDate
@testable import Scout

class PersistedScheduleServiceTest : XCTestCase {
    var scheduleService:DataScheduleService!
    let mockWeatherService = MockWeatherService()
    let mockScheduleRepository = MockScheduleRepository()
    
    override func setUpWithError() throws {
        scheduleService = DataScheduleService(weatherService: mockWeatherService,
                                              scheduleRepository: mockScheduleRepository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here.
        // This method is called after the invocation of each test method in the class.
    }
    
    
    func test_scheduleForDays_alwaysReturnsTheNumberOfDaysRequested() {
        let startDate = Date()
        var numberOfDays = 7
        
        var days = scheduleService.getScheduleForDays(startDate: Date(), numberOfDays: numberOfDays)
        XCTAssertEqual(numberOfDays, days.count)
        
        numberOfDays = 14
        days = scheduleService.getScheduleForDays(startDate: startDate, numberOfDays: numberOfDays)
        
        XCTAssertEqual(numberOfDays, days.count)
    }
    
    
    func test_scheduleForDays_firstDayMatchesTheDateProvided() {
        let startDate = Date()
        let numberOfDays = 7
        
        let days = scheduleService.getScheduleForDays(startDate: startDate, numberOfDays: numberOfDays)
        
        XCTAssertEqual(dateToMidnight(startDate), days[0].day)
    }
    
    
    func test_scheduleForDays_eachDayInRangeIncrementsDateByOne() {
        let startDate = Date()
        let numberOfDays = 5
        
        let days = scheduleService.getScheduleForDays(startDate: startDate, numberOfDays: numberOfDays)
        
        for dayIndex in 0 ..< numberOfDays {
            XCTAssertEqual(dateToMidnight(startDate, offset: dayIndex), days[dayIndex].day)
        }
    }
    
    
    func test_scheduleForDays_defaultScheduleShowsNoWeatherData() {
        let startDate = Date()
        let numberOfDays = 3
        
        let days = scheduleService.getScheduleForDays(startDate: startDate, numberOfDays: numberOfDays)
        
        for dayIndex in 0 ..< numberOfDays {
            XCTAssertEqual(days[dayIndex].weather?.temperature, nil)
            XCTAssertEqual(days[dayIndex].weather?.weatherIcon, nil)
        }
    }
    
    
    func test_scheduleForDays_weatherReflectsOutputFromWeatherServiceIfExists() {
        let startDate = Date()
        let numberOfDays = 3
        mockWeatherService.setWeatherForDate(date: startDate, temp: 70, icon: WeatherIcon.sunny)
        mockWeatherService.setWeatherForDate(date: startDate.dateByAdding(2, .day).date,
                                             temp: 60, icon: .rainy)
        
        let days = scheduleService.getScheduleForDays(startDate: startDate, numberOfDays: numberOfDays)
        
        XCTAssertEqual(Weather(date: dateToMidnight(startDate),
                               weatherType: .daily,
                               temperature: 70,
                               weatherIcon: WeatherIcon.sunny), days[0].weather)
        
        XCTAssertEqual(Weather(date: dateToMidnight(startDate, offset: 1)), days[1].weather)
                       
        XCTAssertEqual(Weather(date: dateToMidnight(startDate, offset: 2),
                               weatherType: .daily,
                               temperature: 60,
                               weatherIcon: .rainy), days[2].weather)
    }
    
    private func dateToMidnight(_ date:Date, offset:Int = 0) -> Date {
        return date.dateBySet(hour: 0, min: 0, secs: 0)!.dateByAdding(offset, .day).date
    }
}
