//
//  BookmarksController.swift
//  App
//
//  Created by Владислав Фролов on 17.12.2019.
//

import Vapor

final class BookmarksContoller {
    
    func list(_ request: Request) throws -> Future<[Bookmark]> {
        return Bookmark.query(on: request).all()
    }
    
    func create(_ request: Request) throws -> Future<Bookmark> {
        return try request.content.decode(Bookmark.self).flatMap { bookmark in
            return bookmark.save(on: request)
        }
    }
 
    func update(_ request: Request) throws -> Future<Bookmark> {
        return try request.parameters.next(Bookmark.self).flatMap({ bookmark in
            return try request.content.decode(Bookmark.self).flatMap { newBookmark in
                bookmark.name = newBookmark.name
                bookmark.link = newBookmark.link
                bookmark.imageUrl = newBookmark.imageUrl
                bookmark.isFavorite = newBookmark.isFavorite
                
                return bookmark.save(on: request)
            }
        })
    }
    
    func delete(_ request: Request) throws -> Future<HTTPStatus> {
        return try request.parameters.next(Bookmark.self).flatMap { bookmark in
            return bookmark.delete(on: request)
        }.transform(to: .ok)
    }
}
