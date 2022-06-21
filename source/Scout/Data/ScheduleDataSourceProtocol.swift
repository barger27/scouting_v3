//
//  ScheduleDataSource.swift
//  Scout
//
//  Created by Ryan Barger on 6/16/22.
//

import Foundation

protocol ScheduleDataSourceProtocol {
    func getScheduleForDays(startDate:Date, endDate:Date) -> [DayPlanner]
}
