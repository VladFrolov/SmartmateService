//
//  Task.swift
//  App
//
//  Created by Владислав Фролов on 16.12.2019.
//

import FluentPostgreSQL
import Vapor
import Pagination
    
final class Task: PostgreSQLModel {
    var id: Int?
    var name: String
    var description: String?
    var isResolved: Bool
    var dateCreate: Date?
    var dateCompletion: Date?
    
    init(id: Int? = nil, name: String, description: String = "", isResolved: Bool = false) {
        self.id = id
        self.name = name
        self.description = description
        self.isResolved = isResolved
        self.dateCreate = Date()
    }
}

extension Task: Content {}
extension Task: Migration {}
extension Task: Parameter {}
extension Task: Paginatable {}
