//
//  DayPlanner+CoreDataClass.swift
//  Scout
//
//  Created by Ryan Barger on 7/9/22.
//
//

import Foundation
import CoreData

@objc(DayPlanner)
public class DayPlanner: NSManagedObject {
    public override var description:String {
        return "DayPlanner \(day?.toISO() ?? "")"
    }
}


extension DayPlanner : Comparable {
    public static func < (lhs: DayPlanner, rhs: DayPlanner) -> Bool {
        if let lhsDay = lhs.day,
           let rhsDay = rhs.day
        {
            return lhsDay < rhsDay
        }
        
        if lhs.day == nil && rhs.day != nil {
            return true
        }
        
        if rhs.day == nil && lhs.day != nil {
            return false
        }
        
        return false
    }
}
