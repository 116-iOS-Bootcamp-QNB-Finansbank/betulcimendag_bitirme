//
//  TableDetailViewModel.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import UIKit
import Foundation

class TableDetailViewModel: TableDetailViewModelProtocol {

    
    weak var delegate: TableDetailViewModelDelegate?
    
    private var item: TableListEntity?

    init() {
        
    }
    init(item: TableListEntity) {
        self.item = item
    }
    
    func viewDidLoad() {
        if(item != nil){
            delegate?.showTableDetail(TableDetailPresentation(item: item!))
        }
    }
    
    func saveItem(tableDetailPresentation: TableDetailPresentation) {
        
        if item == nil {
            CoreDataManager.instance.addItem(itemDetailPresentation:tableDetailPresentation)
        } else {
            CoreDataManager.instance.updateItem(itemDetailPresentation:tableDetailPresentation, item:item!)
        }
    }
    
    func isEmpty() -> Bool{
        return item == nil
    }
    
    func deleteItem() {
         
        if item == nil {
            return
        }
        CoreDataManager.instance.deleteItem(item: item!)
    }
}
