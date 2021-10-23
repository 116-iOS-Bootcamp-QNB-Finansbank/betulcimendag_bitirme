//
//  TableDetailPresentation.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import Foundation

struct TableDetailPresentation {
    var name: String
    var detail: String
    var finishTime: Date
    var uuid : UUID?
    
    init(name: String, detail: String, finishTime: Date) {
        self.name = name
        self.detail = detail
        self.finishTime = finishTime
    }
    
    init(name: String, detail: String, finishTime: Date, uuid: UUID) {
        self.name = name
        self.detail = detail
        self.finishTime = finishTime
        self.uuid = uuid
    }
    
    init(item: TableListEntity) {
        self.init(name: item.name!,
                  detail: item.detail!,
                  finishTime: item.finishTime!,
                  uuid: item.uuid ?? UUID())
    }
}
