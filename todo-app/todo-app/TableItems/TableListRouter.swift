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

    }
}
