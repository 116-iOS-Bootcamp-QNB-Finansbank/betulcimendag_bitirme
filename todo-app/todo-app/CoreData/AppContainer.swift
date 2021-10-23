//
//  AppContainer.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import Foundation

let appContainer = AppContainer()

class AppContainer {
    let service = CoreDataManager()
    let router = AppRouter()
}
