//
//  LocationTest.swift
//  ScoutTests
//
//  Created by Ryan Barger on 6/8/22.
//

import XCTest
@testable import Scout

class LocationTest: XCTestCase {

    func test_equals_whenOnlyPostalCode() {
        let loc1 = Location(postalCode: "45202")
        let loc2 = Location(postalCode: "45202")
        let loc3 = Location(postalCode: "45200")
        
        XCTAssertTrue(loc1 == loc2)
        XCTAssertTrue(loc1.logicalEqual(other: loc2))
        XCTAssertTrue(loc1.hashValue == loc2.hashValue)
        
        XCTAssertFalse(loc1 == loc3)
        XCTAssertFalse(loc1.logicalEqual(other: loc3))
    }
    
    
    func test_equals_whenFullAddressProvided() {
        let loc1 = Location(address: "1936 Greentree Rd", city: "Lebanon", state: "OH")
        let loc2 = Location(address: "1936 Greentree Rd", city: "Lebanon", state: "OH")
        let loc3 = Location(address: "100 Joe Nuxhall Way", city: "Cincinnati", state: "OH")
        let loc4 = Location(address: "100 Main Street", city: "Lebanon", state: "OH")
        
        XCTAssertTrue(loc1 == loc2)
        XCTAssertTrue(loc1.hashValue == loc2.hashValue)
        XCTAssertTrue(loc1.logicalEqual(other: loc2))
        
        XCTAssertFalse(loc1 == loc3)
        XCTAssertFalse(loc1.logicalEqual(other: loc3))
        
        XCTAssertFalse(loc1 == loc4)
        XCTAssertFalse(loc1.logicalEqual(other: loc4))
    }
    
    
    func test_equals_whenLatitudeAndLongitudeProvided() {
        let mason = Location(latitude: 39.3601, longitude: 84.3099)
        let cincinnati = Location(latitude: 39.1031, longitude: 84.5120)
        let dayton = Location(latitude: 39.7589, longitude: 84.1916)
        let louisville = Location(latitude: 38.2527, longitude: 85.7585)
        
        XCTAssertFalse(mason == cincinnati)
        XCTAssertTrue(mason.logicalEqual(other: cincinnati))
        
        XCTAssertFalse(cincinnati == dayton)
        XCTAssertFalse(cincinnati.logicalEqual(other: dayton))
        
        XCTAssertFalse(mason == dayton)
        XCTAssertFalse(mason.logicalEqual(other: dayton))
        
        XCTAssertFalse(cincinnati == louisville)
        XCTAssertFalse(cincinnati.logicalEqual(other: louisville))
    }
    
    
    func test_equalsPrecedentWhenEverythingIsProvided() {
        let loc1 = Location(address: "1936 Greentree Rd", city: "Lebanon", state: "OH", postalCode: "45036", latitude: 39.3601, longitude: 84.3099)
        let loc2 = Location(address: "1936 Greentree Rd", city: "Lebanon", state: "OH", postalCode: "45036", latitude: 50.0, longitude: 50.0)
        let loc3 = Location(city: "Lebanon", state: "OH")
        let loc4 = Location(postalCode: "45036")
        let loc5 = Location(latitude: 39.3601, longitude: 84.3099)
        
        XCTAssertTrue(loc1 == loc2)
        XCTAssertTrue(loc1.logicalEqual(other: loc2))
        XCTAssertTrue(loc1.hashValue == loc2.hashValue)

        XCTAssertFalse(loc1 == loc3)
        XCTAssertTrue(loc1.logicalEqual(other: loc3))
        
        XCTAssertFalse(loc1 == loc4)
        XCTAssertTrue(loc1.logicalEqual(other: loc4))
        
        XCTAssertFalse(loc1 == loc5)
        XCTAssertTrue(loc1.logicalEqual(other: loc5))
        
        XCTAssertFalse(loc1 == loc5)
        XCTAssertTrue(loc1.logicalEqual(other: loc5))
        
        XCTAssertFalse(loc3 == loc5)
        XCTAssertFalse(loc3.logicalEqual(other: loc5))
    }
    
    
    func test_description_withPostalCode() {
        let loc = Location(postalCode: "45036")
        
        XCTAssertEqual("45036", loc.description)
    }
    
    
    func test_description_cityState() {
        let loc = Location(city: "Lebanon", state: "OH")
        
        XCTAssertEqual("Lebanon, OH", loc.description)
    }
    
    
    func test_description_withAddress() {
        let loc = Location(address: "1936 Greentree Rd", city: "Lebanon", state: "OH")
        
        XCTAssertEqual("1936 Greentree Rd, Lebanon, OH", loc.description)
    }
    
    
    func test_description_withFullAddress() {
        let loc = Location(address: "1936 Greentree Rd", city: "Lebanon", state: "OH", postalCode: "45036")
        
        XCTAssertEqual("1936 Greentree Rd, Lebanon, OH", loc.description)
    }
    
    
    func test_description_withLatLong() {
        let loc = Location(latitude: 39.3601, longitude: 84.3099)
        
        XCTAssertEqual("(39.3601, 84.3099)", loc.description)
    }
    
    
    func test_description_withEverything() {
        let loc = Location(address: "1936 Greentree Rd", city: "Lebanon", state: "OH", postalCode: "45036", latitude: 39.3601, longitude: 84.3099)
        
        XCTAssertEqual("1936 Greentree Rd, Lebanon, OH", loc.description)
    }
}
