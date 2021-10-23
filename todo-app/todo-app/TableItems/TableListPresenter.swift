//
//  TableListPresenter.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import Foundation

class TableListPresenter: NSObject, TableListPresenterProtocol {
    private unowned let view: TableListViewProtocol
    private let router: TableListRouterProtocol
    var update : (()->Void)?
    
    private var interactor: TableListInteractorProtocol {
        didSet {
            self.interactor.delegate = self
        }
    }
    
    init(interactor: TableListInteractorProtocol,
         view: TableListViewProtocol,
         router: TableListRouterProtocol) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.viewDidLoad()
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        interactor.didSelectRow(at: indexPath)
    }
    func addRow() {
        interactor.addRow()
    }
}

extension TableListPresenter: TableListInteractorDelegate {
    func handleOutput(_ output: TableListInteractorOutput) {
        switch output {
        case .showTableList(let itemList):
            var presenterList: [TableListPresentation] = []
            var i : Int = 0
            
            for item in itemList {
                let p : TableListPresentation = TableListPresentation(item: item , index: i)
                
                presenterList.append(p)
                i = i+1
            }
            view.handleOutput(.showTableList(presenterList))
        case .showTableDetail(let item):
            router.navigate(to: .showTableDetail(item))
        case .showTableDetailEmpty:
            router.navigate(to: .showTableDetailEmpty)
        }
    }
}

