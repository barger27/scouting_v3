//
//  WeatherTests.swift
//  ScoutTests
//
//  Created by Ryan Barger on 6/6/22.
//

import XCTest
@testable import Scout

class WeatherTest: XCTestCase {

    func test_weatherDefaultsToDaily() {
        let weather = Weather(date: Date())
        
        XCTAssertEqual(WeatherType.daily, weather.weatherType)
    }
    
    func test_dailyWeatherSetsDateToMidnight() {
        let weather = Weather(date: Date())
        
        XCTAssertEqual(Date().year, weather.date.year)
        XCTAssertEqual(Date().month, weather.date.month)
        XCTAssertEqual(Date().day, weather.date.day)
        XCTAssertEqual(0, weather.date.hour)
        XCTAssertEqual(0, weather.date.minute)
        XCTAssertEqual(0, weather.date.second)
    }
    
    func test_dailyWeatherSetsDateToMidnightWithFullInit() {
        let weather = Weather(date: Date(), weatherType: .daily, temperature: 80, weatherIcon: WeatherIcon.sunny)
        
        XCTAssertEqual(Date().year, weather.date.year)
        XCTAssertEqual(Date().month, weather.date.month)
        XCTAssertEqual(Date().day, weather.date.day)
        XCTAssertEqual(0, weather.date.hour)
        XCTAssertEqual(0, weather.date.minute)
        XCTAssertEqual(0, weather.date.second)
    }
    
    func test_hourlyWeatherSetsDateToHourAndZeroMinutesSeconds() {
        let weather = Weather(date: Date(), weatherType: .hourly, temperature: 80, weatherIcon: WeatherIcon.sunny)
        
        XCTAssertEqual(Date().year, weather.date.year)
        XCTAssertEqual(Date().month, weather.date.month)
        XCTAssertEqual(Date().day, weather.date.day)
        XCTAssertEqual(Date().hour, weather.date.hour)
        XCTAssertEqual(0, weather.date.minute)
        XCTAssertEqual(0, weather.date.second)
    }
    
    func test_equals_objectEquality() {
        let weather1 = Weather(date: Date(), weatherType: .daily, temperature: 80, weatherIcon: WeatherIcon.sunny)
        let weather2 = weather1
        
        XCTAssertTrue(weather1 == weather2)
    }
    
    func test_equals_eachValueEquals() {
        let weather1 = Weather(date: Date(), weatherType: .daily, temperature: 80, weatherIcon: WeatherIcon.sunny)
        let weather2 = Weather(date: Date(), weatherType: .daily, temperature: 80, weatherIcon: WeatherIcon.sunny)
        
        XCTAssertTrue(weather1 == weather2)
    }
    
    func test_notEquals_oneValuOff() {
        let weather1 = Weather(date: Date(), weatherType: .daily, temperature: 80, weatherIcon: WeatherIcon.sunny)
        let weather2 = Weather(date: Date().dateByAdding(1, .day).date, weatherType: .daily, temperature: 80, weatherIcon: WeatherIcon.sunny)
        let weather3 = Weather(date: Date(), weatherType: .hourly, temperature: 80, weatherIcon: WeatherIcon.sunny)
        let weather4 = Weather(date: Date(), weatherType: .daily, temperature: 75, weatherIcon: WeatherIcon.sunny)
        let weather5 = Weather(date: Date(), weatherType: .daily, temperature: 75, weatherIcon: WeatherIcon.rainy)
        
        XCTAssertFalse(weather1 == weather2)
        XCTAssertFalse(weather1 == weather3)
        XCTAssertFalse(weather1 == weather4)
        XCTAssertFalse(weather1 == weather5)
    }
    
    func test_lessThan_smallerDateShouldBeLessThanGreaterDate() {
        let weather1 = Weather(date: Date(), weatherType: .daily, temperature: 80, weatherIcon: WeatherIcon.sunny)
        let weather2 = Weather(date: Date().dateByAdding(1, .day).date, weatherType: .daily, temperature: 80, weatherIcon: WeatherIcon.sunny)
        
        XCTAssertTrue(weather1 < weather2)
    }
    
    func test_lessThan_greaterDateShouldBeGreaterThanLesserDate() {
        let weather1 = Weather(date: Date(), weatherType: .daily, temperature: 80, weatherIcon: WeatherIcon.sunny)
        let weather2 = Weather(date: Date().dateByAdding(-1, .day).date, weatherType: .daily, temperature: 80, weatherIcon: WeatherIcon.sunny)
        
        XCTAssertTrue(weather1 > weather2)
    }
}
