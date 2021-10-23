//
//  TableListContracts.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import Foundation

//MARK: View
protocol TableListViewProtocol: NSObject {
    func handleOutput(_ output: TableListPresenterOutput)
}

//MARK: Interactor
enum TableListInteractorOutput {
    case showTableDetail(TableListEntity)
    case showTableList([TableListEntity])
    case showTableDetailEmpty
}

protocol TableListInteractorDelegate: NSObject {
    func handleOutput(_ output: TableListInteractorOutput)
}

protocol TableListInteractorProtocol: NSObject {
    var delegate: TableListInteractorDelegate? { get set }
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
    func addRow()
}

//MARK: Presenter
protocol TableListPresenterProtocol: NSObject {
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
    func addRow()
}

enum TableListPresenterOutput {
    case showTableList([TableListPresentation])
}

//MARK: Router
enum TableListRoute {
    case showTableDetail(TableListEntity)
    case showTableDetailEmpty
}

protocol TableListRouterProtocol: NSObject {
    func navigate(to route: TableListRoute)
}
