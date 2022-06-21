//
//  Team.swift
//  Scout
//
//  Created by Ryan Barger on 5/24/22.
//

import Foundation


struct Team : Identifiable, Equatable, Comparable, Hashable {
    let id:UUID
    let name:String
    let abbr:String
    
    init(id: UUID, name:String, abbr:String? = nil) {
        self.id = id
        self.name = name
        self.abbr = abbr ?? name
                                .uppercased()
                                .split(separator: " ")
                                .map { word in word.prefix(1) }
                                .joined()
    }
    
    init(name:String) {
        self.init(id: UUID(), name: name)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    static func ==(lhs:Team, rhs:Team) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    static func <(lhs:Team, rhs:Team) -> Bool {
        lhs.name < rhs.name
    }
}
