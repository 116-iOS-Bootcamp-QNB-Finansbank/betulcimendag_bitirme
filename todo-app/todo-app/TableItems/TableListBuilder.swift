//
//  TableListBuilder.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import UIKit

class TableListBuilder {
    static func build() -> TableListViewController {
        let storyboard = UIStoryboard(name: "TableList", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "TableListViewController") as! TableListViewController
        let interactor = TableListInteractor(service: appContainer.service)
        let router = TableListRouter(view: view)
        let presenter = TableListPresenter(interactor: interactor, view: view, router: router)
        view.presenter = presenter
        interactor.delegate = presenter
        return view
    }
}

