//
//  TeamTest.swift
//  ScoutTests
//
//  Created by Ryan Barger on 6/17/22.
//

import XCTest
@testable import Scout

class TeamTest: XCTestCase {

    func test_equals_objectEquality() {
        let team1 = Team(id: UUID(), name: "Indiana University", abbr: "IU")
        let team2 = team1
        
        XCTAssertEqual(team1, team2)
    }

    
    func test_equals_byID() {
        let id = UUID()
        let team1 = Team(id: id, name: "Indiana University", abbr: "IU")
        let team2 = Team(id: id, name: "Purdue Univeristy", abbr: "PU")
        
        XCTAssertEqual(team1, team2)
    }
    
    func test_hashValue_equalItemsHaveSameHash() {
        let id = UUID()
        let team1 = Team(id: id, name: "Indiana University", abbr: "IU")
        let team2 = Team(id: id, name: "Purdue Univeristy", abbr: "PU")
        
        XCTAssertEqual(team1.hashValue, team2.hashValue)
    }
    
    
    func test_lessThan_byName() {
        let indiana = Team(id: UUID(), name: "Indiana University", abbr: "IU")
        let purdue = Team(id: UUID(), name: "Purdue Univeristy", abbr: "PU")
        
        XCTAssertTrue(indiana < purdue)
        XCTAssertTrue(purdue > indiana)
    }
    
    
    func test_init_autoAbbreviation() {
        let indiana = Team(name: "Indiana University")
        
        XCTAssertEqual("IU", indiana.abbr)
    }
}
