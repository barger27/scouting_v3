//
//  PlayerTest.swift
//  ScoutTests
//
//  Created by Ryan Barger on 6/7/22.
//

import XCTest
@testable import Scout

class PlayerTest: XCTestCase {
    
    func test_equals_objectEquality() {
        let player1 = Player(id: UUID(), firstName: "Ryan", lastName: "Barger")
        let player2 = player1
        
        XCTAssertEqual(player1, player2)
    }
    
    
    func test_equals_byID() {
        let id = UUID()
        let player1 = Player(id: id, firstName: "Ryan", lastName: "Barger")
        let player2 = Player(id: id, firstName: "Jeff", lastName: "Thomas")
        
        XCTAssertEqual(player1, player2)
    }

    
    func test_lessThan_byName() {
        let player1 = Player(firstName: "Ryan", lastName: "Barger")
        let player2 = Player(firstName: "Jeff", lastName: "Thomas")
        let player3 = Player(firstName: "Ray", lastName: "Barger")
        
        XCTAssertTrue(player1 < player2)
        XCTAssertTrue(player1 > player3)
    }
}
