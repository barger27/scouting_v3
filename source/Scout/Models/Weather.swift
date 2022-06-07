//
//  Weather.swift
//  Scout
//
//  Created by Ryan Barger on 6/6/22.
//

import Foundation
import SwiftDate


struct Weather : Equatable, Comparable, Hashable {
    let weatherType:WeatherType
    let date:Date
    let temperature:Int?
    let weatherIcon:WeatherIcon?
    
    
    init(date:Date, weatherType:WeatherType = .daily, temperature:Int? = nil, weatherIcon:WeatherIcon? = nil) {
        self.weatherType = weatherType
        self.date = (weatherType == .daily) ? date.dateBySet(hour: 0, min: 0, secs: 0) ?? date :
                                              date.dateBySet(hour: date.hour, min: 0, secs: 0) ?? date
        self.temperature = temperature
        self.weatherIcon = weatherIcon
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date.year)
        hasher.combine(date.month)
        hasher.combine(date.day)
        hasher.combine(date.hour)
    }
    
    
    static func ==(lhs: Weather, rhs: Weather) -> Bool {
        return  lhs.date == rhs.date &&
                lhs.weatherType == rhs.weatherType &&
                lhs.temperature == rhs.temperature &&
                lhs.weatherIcon == rhs.weatherIcon
    }
    
    static func < (lhs:Weather, rhs:Weather) -> Bool {
        return lhs.date < rhs.date
    }
}


enum WeatherType {
    case hourly
    case daily
}


enum WeatherIcon : String {
    case sunny = "weather_sunny"
    case cloudy = "weather_cloudy"
    case stormy = "weather_storm"
    case rainy = "weather_rain"
    case fog = "weather_fog"
    case isolated_flurries = "weather_iso_flurries"
    case isolated_rain = "weather_iso_rain"
    case isolated_snow = "weather_iso_snow"
    case isolated_storms = "weather_iso_storm"
    case light_rain = "weather_light_rain"
    case wintry_mix = "weather_mix"
    case snow = "weather_snow"
    case partly_sunny = "weather_sunny_partly"
}
