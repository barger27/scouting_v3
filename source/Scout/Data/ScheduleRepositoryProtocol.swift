//
//  ScheduleRepositoryProtocol.swift
//  Scout
//
//  Created by Ryan Barger on 6/6/22.
//

import Foundation

protocol ScheduleRepositoryProtocol {
    func getSchedule(startDate:Date, endDate:Date) async throws -> [ DayPlanner ]
}
