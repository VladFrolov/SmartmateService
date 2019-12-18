//
//  Bookmark.swift
//  App
//
//  Created by Владислав Фролов on 16.12.2019.
//

import FluentPostgreSQL
import Vapor
import Pagination

final class Bookmark: PostgreSQLModel {
    var id: Int?
    var name: String
    var link: String
    var imageUrl: String
    var isFavorite: Bool
    var dateCreate: Date?
    
    init(id: Int? = nil, name: String, link: String, imageUrl: String, isFav: Bool = false) {
        self.id = id
        self.name = name
        self.link = link
        self.imageUrl = imageUrl
        self.isFavorite = isFav
        self.dateCreate = Date()
    }
}

extension Bookmark: Content {}
extension Bookmark: Migration {}
extension Bookmark: Parameter {}
extension Bookmark: Paginatable {}
