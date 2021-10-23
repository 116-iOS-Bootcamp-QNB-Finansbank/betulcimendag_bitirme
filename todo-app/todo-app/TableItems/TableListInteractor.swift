//
//  TableListInteractor.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//


import UIKit
import Foundation

class TableListInteractor: NSObject, TableListInteractorProtocol {
    weak var delegate: TableListInteractorDelegate?
    private let service: CoreDataManager
    private var tableLists: [TableListEntity] = []
    
    init(service: CoreDataManager) {
        self.service = service
    }
    
    func viewDidLoad() {
        // send screen name event
        getTableList()
    }
    
    func getTableList() {
        let results: [TableListEntity] = service.getTodoList()
        self.tableLists = results
        self.delegate?.handleOutput(.showTableList(results))
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let todo = tableLists[indexPath.row]
        self.delegate?.handleOutput(.showTableDetail(todo))
    }
    
    func addRow() {
        let todo = TableListEntity()
        self.delegate?.handleOutput(.showTableDetailEmpty)
    }
}
