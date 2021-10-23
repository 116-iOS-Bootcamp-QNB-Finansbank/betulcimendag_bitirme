//
//  CoreDataManager.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    
    var context: NSManagedObjectContext

    init() {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            context = appDelegate.persistentContainer.viewContext
        }
    
    private func saveContext() {
        do {
           try context.save()
        }
        catch {
        }
    }
    
    func getTodoList() -> [TableListEntity] {
        
        let fetchRequest: NSFetchRequest<TableListEntity> = TableListEntity.fetchRequest()
        var results: [TableListEntity] = []
        do {
            results = try context.fetch(fetchRequest)
        } catch {
            //handle error
        }
        
        return results
    }
    

    
    func deleteTodo(todo : TableListEntity) {
        
        do {
            context.delete(todo)
            try context.save()
        }
        catch {
            // Handle Error
        }
    }
}

