//
//  CoreDataSource.swift
//  Scout
//
//  Created by Ryan Barger on 7/6/22.
//

import CoreData
import Foundation

class SQLiteCoreDataSource : CoreDataSourceProtocol {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ScoutingModel")
        let description = container.persistentStoreDescriptions.first
        description?.type = NSSQLiteStoreType
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    lazy var backgroundContext: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        context.parent = self.mainContext
        
        return context
    }()
    
    lazy var mainContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
}
