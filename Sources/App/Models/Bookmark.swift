//
//  Bookmark.swift
//  App
//
//  Created by Владислав Фролов on 16.12.2019.
//

import FluentSQLite
import Vapor

final class Bookmark: SQLiteModel {
    var id: Int?
    var name: String
    var link: String
    var imageUrl: String
    var isFavorite: Bool?
    
    init(id: Int? = nil, name: String, link: String, imageUrl: String, isFav: Bool = false) {
        self.id = id
        self.name = name
        self.link = link
        self.imageUrl = imageUrl
        self.isFavorite = isFav
    }
}

extension Bookmark: Content {}
extension Bookmark: Migration {}
extension Bookmark: Parameter {}
