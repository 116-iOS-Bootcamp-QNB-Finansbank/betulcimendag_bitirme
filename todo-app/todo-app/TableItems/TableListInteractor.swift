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
    private let dataManager: CoreDataManager
    private var tableLists: [TableListEntity] = []
    
    init(manager: CoreDataManager) {
        self.dataManager = manager
    }
    
    func viewDidLoad() {
        // send screen name event
        getTableList()
    }
    
    func getTableList() {
        let results: [TableListEntity] = dataManager.getTableList()
        self.tableLists = results
        self.delegate?.handleOutput(.showTableList(results))
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let item = tableLists[indexPath.row]
        self.delegate?.handleOutput(.showTableDetail(item))
    }
    
    func addRow() {
    
        self.delegate?.handleOutput(.showTableDetailEmpty)
    }
}
