//
//  Address+CoreDataProperties.swift
//  Scout
//
//  Created by Ryan Barger on 7/9/22.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var addressID: UUID?
    @NSManaged public var address1: String?
    @NSManaged public var address2: String?
    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var postalCode: String?
    @NSManaged public var country: String?
    @NSManaged public var addressType: String?
    @NSManaged public var team: NSSet?
    @NSManaged public var player: Player?

}

// MARK: Generated accessors for team
extension Address {

    @objc(addTeamObject:)
    @NSManaged public func addToTeam(_ value: Team)

    @objc(removeTeamObject:)
    @NSManaged public func removeFromTeam(_ value: Team)

    @objc(addTeam:)
    @NSManaged public func addToTeam(_ values: NSSet)

    @objc(removeTeam:)
    @NSManaged public func removeFromTeam(_ values: NSSet)

}

extension Address : Identifiable {

}
