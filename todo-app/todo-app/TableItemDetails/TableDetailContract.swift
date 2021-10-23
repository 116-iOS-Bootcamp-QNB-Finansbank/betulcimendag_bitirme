//
//  TableDetailContract.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import Foundation
protocol TableDetailViewModelDelegate: NSObject {
    func showTableDetail(_ item: TableDetailPresentation)
}

protocol TableDetailViewModelProtocol {
    var delegate: TableDetailViewModelDelegate? { get set }
    func viewDidLoad()
    func saveItem(tableDetailPresentation : TableDetailPresentation)
    func deleteItem()
    func isEmpty() -> Bool
}
