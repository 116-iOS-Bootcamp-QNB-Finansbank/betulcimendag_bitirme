//
//  TableDetailBuilder.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//


import Foundation
class TableDetailBuilder {
    static func build(with item: TableListEntity) -> TableDetailViewController {
        let viewController = TableDetailViewController()
        viewController.viewModel = TableDetailViewModel(item: item)
        return viewController
    }
    static func buildEmpty() -> TableDetailViewController {
        let viewController = TableDetailViewController()
        viewController.viewModel = TableDetailViewModel()
        return viewController
    }
}
