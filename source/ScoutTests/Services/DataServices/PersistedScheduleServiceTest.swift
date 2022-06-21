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
    let mockScheduleRepository = MockScheduleRepository()
    
    override func setUpWithError() throws {
        scheduleService = DataScheduleService(scheduleRepository: mockScheduleRepository)
    }
    
    
    func test_scheduleForDays_alwaysReturnsTheNumberOfDaysRequested() async throws {
        let startDate = Date()
        var numberOfDays = 7
    
        var days = try await scheduleService.getScheduleForDays(startDate: Date(), numberOfDays: numberOfDays)
        XCTAssertEqual(numberOfDays, days.count)
        
        numberOfDays = 14
        days = try await scheduleService.getScheduleForDays(startDate: startDate, numberOfDays: numberOfDays)
        
        XCTAssertEqual(numberOfDays, days.count)
    }
    
    
    func test_scheduleForDays_firstDayMatchesTheDateProvided() async throws {
        let startDate = Date()
        let numberOfDays = 7
        
        let days = try await scheduleService.getScheduleForDays(startDate: startDate, numberOfDays: numberOfDays)
        XCTAssertEqual(dateToMidnight(startDate), days[0].day)
    }
    
    
    func test_scheduleForDays_eachDayInRangeIncrementsDateByOne() async throws {
        let startDate = Date()
        let numberOfDays = 5
        
        let days = try await scheduleService.getScheduleForDays(startDate: startDate, numberOfDays: numberOfDays)
        XCTAssertTrue(days.count > 0)
        
        for dayIndex in 0 ..< numberOfDays {
            if days.count > dayIndex {
                XCTAssertEqual(dateToMidnight(startDate, offset: dayIndex), days[dayIndex].day)
            }
        }
    }
    
    
    private func dateToMidnight(_ date:Date, offset:Int = 0) -> Date {
        return date.dateBySet(hour: 0, min: 0, secs: 0)!.dateByAdding(offset, .day).date
    }
}
