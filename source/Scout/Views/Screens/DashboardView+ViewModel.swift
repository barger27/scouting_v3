//
//  Dashboard+ViewModel.swift
//  Scout
//
//  Created by Ryan Barger on 6/3/22.
//

import Foundation
import Combine

extension DashboardView {
    class ViewModel: ObservableObject {
        // Dependencies
        private let _scheduleService:ScheduleServiceProtocol
        
        
        init(scheduleService:ScheduleServiceProtocol) {
            self._scheduleService = scheduleService
        }
        
        
        // Bindable Properties
        @Published var weeklyPlan:[DayPlanner] = []
        
        
        func initializeView() async {
            do {
                weeklyPlan = try await _scheduleService.getScheduleForDays(startDate: Date(), numberOfDays: 7)
            }
            catch {
                print("Error occurred fetching the schedule")
            }
        }
    }
}
