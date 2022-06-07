//
//  ScheduleServiceProtocol.swift
//  Scout
//
//  Created by Ryan Barger on 6/3/22.
//

import Foundation

protocol ScheduleServiceProtocol {
    func getScheduleForDays(startDate:Date, numberOfDays:Int) -> [DayPlanner]
}
