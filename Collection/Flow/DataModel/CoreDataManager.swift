//
//  CoreDataManager.swift
//  Collection
//
//  Created by Станислав Москальцов  on 07.07.2022.
//

import Foundation
import CoreData
import UIKit.UIImage

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func newItems (time: String,date: String,text: String,image: Data) -> Item {
        let item = Item(context: persistentContainer.viewContext)
        item.date = date
        item.image = image
        item.text = text
        item.time = time
        return item
    }
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

