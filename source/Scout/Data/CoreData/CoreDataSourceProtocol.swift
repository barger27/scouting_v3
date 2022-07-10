//
//  CoreDataSourceProtocol.swift
//  Scout
//
//  Created by Ryan Barger on 7/9/22.
//

import CoreData
import Foundation

protocol CoreDataSourceProtocol {
    var persistentContainer:NSPersistentContainer { get }
    var backgroundContext:NSManagedObjectContext { get }
    var mainContext:NSManagedObjectContext { get }
}
