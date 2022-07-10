//
//  Player+CoreDataClass.swift
//  Scout
//
//  Created by Ryan Barger on 7/9/22.
//
//

import Foundation
import CoreData

@objc(Player)
public class Player: NSManagedObject {
}

extension Player: Comparable {

    public static func < (lhs:Player, rhs:Player) -> Bool {
        (lhs.lastName ?? "") + (lhs.firstName ?? "") < (rhs.lastName ?? "") + (rhs.firstName ?? "")
    }
}
