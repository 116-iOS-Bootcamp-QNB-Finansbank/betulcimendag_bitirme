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
    
    func getTableList() -> [TableListEntity] {
        
        let fetchRequest: NSFetchRequest<TableListEntity> = TableListEntity.fetchRequest()
        var results: [TableListEntity] = []
        do {
            results = try context.fetch(fetchRequest)
        } catch {
            //handle error
        }
        
        return results
    }
    
    func addItem(itemDetailPresentation: TableDetailPresentation) {
         
        let item : TableListEntity = TableListEntity(context: context)
        item.uuid = UUID()
        item.name = itemDetailPresentation.name
        item.detail = itemDetailPresentation.detail
        item.finishTime = itemDetailPresentation.finishTime
          
        saveContext()
    }
    
    func updateItem(itemDetailPresentation: TableDetailPresentation, item : TableListEntity) {
        
        item.name = itemDetailPresentation.name
        item.detail = itemDetailPresentation.detail
        item.finishTime = itemDetailPresentation.finishTime
        
        saveContext()
    }
    
    func deleteItem(item : TableListEntity) {
        
        do {
            context.delete(item)
            try context.save()
        }
        catch {
            // Handle Error
        }
    }
}

