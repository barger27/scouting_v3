//
//  Team+CoreDataProperties.swift
//  Scout
//
//  Created by Ryan Barger on 7/9/22.
//
//

import Foundation
import CoreData


extension Team {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Team> {
        return NSFetchRequest<Team>(entityName: "Team")
    }

    @NSManaged public var abbreviation: String?
    @NSManaged public var longName: String?
    @NSManaged public var teamID: UUID?
    @NSManaged public var shortName: String?
    @NSManaged public var level: String?
    @NSManaged public var nickname: String?
    @NSManaged public var ballparkName: String?
    @NSManaged public var logo: URL?
    @NSManaged public var roster: NSSet?
    @NSManaged public var addresses: NSSet?
    @NSManaged public var parentTeam: Team?
    @NSManaged public var highSchoolAlumni: NSSet?
    @NSManaged public var collegeAlumni: NSSet?
    @NSManaged public var affiliates: NSSet?

}

// MARK: Generated accessors for roster
extension Team {

    @objc(addRosterObject:)
    @NSManaged public func addToRoster(_ value: Player)

    @objc(removeRosterObject:)
    @NSManaged public func removeFromRoster(_ value: Player)

    @objc(addRoster:)
    @NSManaged public func addToRoster(_ values: NSSet)

    @objc(removeRoster:)
    @NSManaged public func removeFromRoster(_ values: NSSet)

}

// MARK: Generated accessors for addresses
extension Team {

    @objc(addAddressesObject:)
    @NSManaged public func addToAddresses(_ value: Address)

    @objc(removeAddressesObject:)
    @NSManaged public func removeFromAddresses(_ value: Address)

    @objc(addAddresses:)
    @NSManaged public func addToAddresses(_ values: NSSet)

    @objc(removeAddresses:)
    @NSManaged public func removeFromAddresses(_ values: NSSet)

}

// MARK: Generated accessors for highSchoolAlumni
extension Team {

    @objc(addHighSchoolAlumniObject:)
    @NSManaged public func addToHighSchoolAlumni(_ value: Player)

    @objc(removeHighSchoolAlumniObject:)
    @NSManaged public func removeFromHighSchoolAlumni(_ value: Player)

    @objc(addHighSchoolAlumni:)
    @NSManaged public func addToHighSchoolAlumni(_ values: NSSet)

    @objc(removeHighSchoolAlumni:)
    @NSManaged public func removeFromHighSchoolAlumni(_ values: NSSet)

}

// MARK: Generated accessors for collegeAlumni
extension Team {

    @objc(addCollegeAlumniObject:)
    @NSManaged public func addToCollegeAlumni(_ value: Player)

    @objc(removeCollegeAlumniObject:)
    @NSManaged public func removeFromCollegeAlumni(_ value: Player)

    @objc(addCollegeAlumni:)
    @NSManaged public func addToCollegeAlumni(_ values: NSSet)

    @objc(removeCollegeAlumni:)
    @NSManaged public func removeFromCollegeAlumni(_ values: NSSet)

}

// MARK: Generated accessors for affiliates
extension Team {

    @objc(addAffiliatesObject:)
    @NSManaged public func addToAffiliates(_ value: Team)

    @objc(removeAffiliatesObject:)
    @NSManaged public func removeFromAffiliates(_ value: Team)

    @objc(addAffiliates:)
    @NSManaged public func addToAffiliates(_ values: NSSet)

    @objc(removeAffiliates:)
    @NSManaged public func removeFromAffiliates(_ values: NSSet)

}

extension Team : Identifiable {

}
