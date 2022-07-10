//
//  DayPlanner+CoreDataProperties.swift
//  Scout
//
//  Created by Ryan Barger on 7/9/22.
//
//

import Foundation
import CoreData


extension DayPlanner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayPlanner> {
        return NSFetchRequest<DayPlanner>(entityName: "DayPlanner")
    }

    @NSManaged public var day: Date?
    @NSManaged public var location: String?
    @NSManaged public var startTime: Date?
    @NSManaged public var tournament: String?
    @NSManaged public var players: Set<Player>?

}

// MARK: Generated accessors for players
extension DayPlanner {

    @objc(insertObject:inPlayersAtIndex:)
    @NSManaged public func insertIntoPlayers(_ value: Player, at idx: Int)

    @objc(removeObjectFromPlayersAtIndex:)
    @NSManaged public func removeFromPlayers(at idx: Int)

    @objc(insertPlayers:atIndexes:)
    @NSManaged public func insertIntoPlayers(_ values: [Player], at indexes: NSIndexSet)

    @objc(removePlayersAtIndexes:)
    @NSManaged public func removeFromPlayers(at indexes: NSIndexSet)

    @objc(replaceObjectInPlayersAtIndex:withObject:)
    @NSManaged public func replacePlayers(at idx: Int, with value: Player)

    @objc(replacePlayersAtIndexes:withPlayers:)
    @NSManaged public func replacePlayers(at indexes: NSIndexSet, with values: [Player])

    @objc(addPlayersObject:)
    @NSManaged public func addToPlayers(_ value: Player)

    @objc(removePlayersObject:)
    @NSManaged public func removeFromPlayers(_ value: Player)

    @objc(addPlayers:)
    @NSManaged public func addToPlayers(_ values: NSOrderedSet)

    @objc(removePlayers:)
    @NSManaged public func removeFromPlayers(_ values: NSOrderedSet)

}

extension DayPlanner : Identifiable {

}
