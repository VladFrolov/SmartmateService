//
//  BookmarksController.swift
//  App
//
//  Created by Владислав Фролов on 17.12.2019.
//

import Vapor
import Pagination

final class BookmarksContoller {
    
    func list(_ req: Request) throws -> Future<Paginated<Bookmark>> {
        return try Bookmark.query(on: req).paginate(for: req)
    }
    
    func create(_ req: Request) throws -> Future<Bookmark> {
        return try req.content.decode(Bookmark.self).flatMap { bookmark in
            return bookmark.save(on: req)
        }
    }
 
    func update(_ req: Request) throws -> Future<Bookmark> {
        return try req.parameters.next(Bookmark.self).flatMap({ bookmark in
            return try req.content.decode(Bookmark.self).flatMap { newBookmark in
                bookmark.name = newBookmark.name
                bookmark.link = newBookmark.link
                bookmark.imageUrl = newBookmark.imageUrl
                bookmark.isFavorite = newBookmark.isFavorite
                
                return bookmark.save(on: req)
            }
        })
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Bookmark.self).flatMap { bookmark in
            return bookmark.delete(on: req)
        }.transform(to: .ok)
    }
}
