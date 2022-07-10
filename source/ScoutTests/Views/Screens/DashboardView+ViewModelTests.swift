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
        self.viewModel = DashboardView.ViewModel(scheduleService: mockScheduleService)
            
        self.continueAfterFailure = false
    }
    
    
    func testWeeklyPlan_contains7Days() async {
        await viewModel.initializeView()
        let days = viewModel.weeklyPlan
        
        XCTAssertEqual(7, days.count)
    }
    
    
    func testWeeklyPlan_startsWithToday() async {
        await viewModel.initializeView()
        let days = viewModel.weeklyPlan
        
        XCTAssertTrue(days.count > 0)
        XCTAssertEqual(days[0].day?.month, Date().month)
        XCTAssertEqual(days[0].day?.day, Date().day)
        XCTAssertEqual(days[0].day?.year, Date().year)
    }
    
    
    func testWeeklyPlan_returnsDaysInOrder() async {
        await viewModel.initializeView()
        let days = viewModel.weeklyPlan
        let sortedDays = viewModel.weeklyPlan.sorted()
        
        XCTAssertTrue(days.count > 0)
        
        if (days.count > 0) {
            for dayIndex in 0 ..< 7 {
                XCTAssertEqual(days[dayIndex], sortedDays[dayIndex])
            }
        }
    }
}
