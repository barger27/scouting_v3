//
//  DashboardView+ViewModelTests.swift
//  ScoutTests
//
//  Created by Ryan Barger on 6/3/22.
//

import Foundation
import XCTest
import SwiftDate
@testable import Scout

class DashboardViewViewModelTests : XCTestCase {
    var viewModel:DashboardView.ViewModel!
    
    
    override func setUpWithError() throws {
        let mockScheduleService = MockScheduleService()
        
        viewModel = DashboardView.ViewModel(scheduleService: mockScheduleService)
        viewModel.initializeView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here.
        // This method is called after the invocation of each test method in the class.
    }
    
    
    func testWeeklyPlan_contains7Days() {
        let days = viewModel.weeklyPlan
        
        XCTAssertEqual(7, days.count)
    }
    
    
    func testWeeklyPlan_startsWithToday() {
        let days = viewModel.weeklyPlan
        
        XCTAssertEqual(days[0].day.month, Date().month)
        XCTAssertEqual(days[0].day.day, Date().day)
        XCTAssertEqual(days[0].day.year, Date().year)
    }
    
    
    func testWeeklyPlan_returnsDaysInOrder() {
        let days = viewModel.weeklyPlan
        let sortedDays = viewModel.weeklyPlan.sorted()
        
        for dayIndex in 0 ..< 7 {
            XCTAssertEqual(days[dayIndex], sortedDays[dayIndex])
        }
    }
}
