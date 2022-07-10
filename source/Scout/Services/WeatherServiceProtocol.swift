//
//  WeatherServiceProtocol.swift
//  Scout
//
//  Created by Ryan Barger on 6/6/22.
//

import Foundation

protocol WeatherServiceProtocol {
    func getDailyWeather(for address:Address, on date:Date) async throws -> Weather
}
