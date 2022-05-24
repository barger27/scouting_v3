//
//  Team.swift
//  Scout
//
//  Created by Ryan Barger on 5/24/22.
//

import Foundation


struct Team : Identifiable {
    var id:UUID
    var name:String
    
    
    init(id:UUID, name:String) {
        self.id = id
        self.name = name
    }
    
    
    init(name:String) {
        self.id = UUID()
        self.name = name
    }
}
