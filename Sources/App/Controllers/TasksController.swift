//
//  TasksController.swift
//  App
//
//  Created by Владислав Фролов on 17.12.2019.
//

import Vapor
import Pagination

final class TasksController {
    
    func list(_ req: Request) throws -> Future<Paginated<Task>> {
        return try Task.query(on: req).paginate(for: req)
    }
    
    func create(_ req: Request) throws -> Future<Task> {
        return try req.content.decode(Task.self).flatMap { task in
            return task.save(on: req)
        }
    }
    
    func update(_ req: Request) throws -> Future<Task> {
        return try req.parameters.next(Task.self).flatMap({ task in
            return try req.content.decode(Task.self).flatMap { newTask in
                task.name = newTask.name
                task.description = newTask.description
                task.isResolved = newTask.isResolved
                
                return task.save(on: req)
            }
        })
    }
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Task.self).flatMap { task in
            return task.delete(on: req)
        }.transform(to: .ok)
    }
}
