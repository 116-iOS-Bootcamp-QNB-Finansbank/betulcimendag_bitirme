//
//  TableListPresentation.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import Foundation

struct TableListPresentation {
    let title: String
    let date:Date
    let index: Int
    
    init(title: String, date : Date, index: Int) {
        self.title = title
        self.date = date
        self.index = index
    }
    
    init(item: TableListEntity, index: Int) {
        self.init(title: item.name!, date: item.finishTime!, index: index)
    }
}
