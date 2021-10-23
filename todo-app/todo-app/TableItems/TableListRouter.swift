//
//  TableListRouter.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import UIKit

class TableListRouter: NSObject, TableListRouterProtocol {
    private unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: TableListRoute) {
        switch route {
        case .showTableDetail(let item):
            let viewController = TableDetailBuilder.build(with: item)
            self.view.navigationController?.pushViewController(viewController, animated: true)
        
        case .showTableDetailEmpty:
            let viewController = TableDetailBuilder.buildEmpty()
            self.view.navigationController?.pushViewController(viewController, animated: true)
        }
    }

}
