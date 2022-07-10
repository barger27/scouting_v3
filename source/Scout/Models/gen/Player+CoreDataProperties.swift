//
//  Player+CoreDataProperties.swift
//  Scout
//
//  Created by Ryan Barger on 7/9/22.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var playerID: UUID?
    @NSManaged public var middleName: String?
    @NSManaged public var rosterName: String?
    @NSManaged public var birthCity: String?
    @NSManaged public var birthState: String?
    @NSManaged public var birthCountry: String?
    @NSManaged public var birthdate: String?
    @NSManaged public var heightInches: Int64
    @NSManaged public var weightPounds: Int64
    @NSManaged public var batSide: String?
    @NSManaged public var throwSide: String?
    @NSManaged public var mobilePhone: String?
    @NSManaged public var email: String?
    @NSManaged public var twitter: String?
    @NSManaged public var highSchoolGradYear: Int64
    @NSManaged public var collegeGradYear: Int64
    @NSManaged public var gradeLevel: String?
    @NSManaged public var territory: String?
    @NSManaged public var proEligibleYear: Int64
    @NSManaged public var uniformNumber: Int64
    @NSManaged public var positions: [String]?
    @NSManaged public var createdDate: Date?
    @NSManaged public var modifiedDate: Date?
    @NSManaged public var currentTeam: Team?
    @NSManaged public var highSchool: Team?
    @NSManaged public var college: Team?
    @NSManaged public var addresses: Set<Address>?
    @NSManaged public var dayPlans: Set<DayPlanner>?

}

// MARK: Generated accessors for addresses
extension Player {

    @objc(addAddressesObject:)
    @NSManaged public func addToAddresses(_ value: Address)

    @objc(removeAddressesObject:)
    @NSManaged public func removeFromAddresses(_ value: Address)

    @objc(addAddresses:)
    @NSManaged public func addToAddresses(_ values: Set<Address>)

    @objc(removeAddresses:)
    @NSManaged public func removeFromAddresses(_ values: Set<Address>)

}

// MARK: Generated accessors for dayPlans
extension Player {

    @objc(addDayPlansObject:)
    @NSManaged public func addToDayPlans(_ value: DayPlanner)

    @objc(removeDayPlansObject:)
    @NSManaged public func removeFromDayPlans(_ value: DayPlanner)

    @objc(addDayPlans:)
    @NSManaged public func addToDayPlans(_ values: Set<DayPlanner>)

    @objc(removeDayPlans:)
    @NSManaged public func removeFromDayPlans(_ values: Set<DayPlanner>)

}

extension Player : Identifiable {

}
