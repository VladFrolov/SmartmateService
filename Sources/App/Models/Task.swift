//
//  Task.swift
//  App
//
//  Created by Владислав Фролов on 16.12.2019.
//

import FluentSQLite
import Vapor

final class Task: SQLiteModel {
    var id: Int?
    var name: String
    var description: String?
    var isResolved: Bool?
    
    init(id: Int? = nil, name: String, description: String = "", isResolved: Bool = false) {
        self.id = id
        self.name = name
        self.description = description
        self.isResolved = isResolved
    }
}

extension Task: Content {}
extension Task: Migration {}
extension Task: Parameter {}
