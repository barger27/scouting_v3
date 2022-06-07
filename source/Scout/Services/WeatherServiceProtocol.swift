//
//  WeatherServiceProtocol.swift
//  Scout
//
//  Created by Ryan Barger on 6/6/22.
//

import Foundation

protocol WeatherServiceProtocol {
    func getWeatherForDateRange(startDate: Date, endDate: Date) -> [ Date : Weather ]
}
