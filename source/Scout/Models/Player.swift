//
//  Player.swift
//  Scout
//
//  Created by Ryan Barger on 5/24/22.
//

import Foundation

struct Player : Identifiable, Equatable, Comparable, Hashable {
    var id:UUID
    var firstName:String
    var lastName:String
    var team:Team?
    
    
    init(id:UUID, firstName:String, lastName:String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
    
    
    init(firstName:String, lastName:String) {
        self.init(id: UUID(), firstName: firstName, lastName: lastName)
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    static func ==(lhs:Player, rhs:Player) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    static func <(lhs:Player, rhs:Player) -> Bool {
        lhs.lastName + lhs.firstName < rhs.lastName + rhs.firstName
    }
}
