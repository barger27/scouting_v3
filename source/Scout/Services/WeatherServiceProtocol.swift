//
//  WeatherServiceProtocol.swift
//  Scout
//
//  Created by Ryan Barger on 6/6/22.
//

import Foundation

protocol WeatherServiceProtocol {
    func getDailyWeather(for location:Location, on date:Date) async throws -> Weather
}
