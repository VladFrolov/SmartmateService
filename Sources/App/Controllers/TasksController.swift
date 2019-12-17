//
//  TasksController.swift
//  App
//
//  Created by Владислав Фролов on 17.12.2019.
//

import Vapor

final class TasksController {
    
    func list(_ request: Request) throws -> Future<[Task]> {
        return Task.query(on: request).all()
    }
    
    func create(_ request: Request) throws -> Future<Task> {
        return try request.content.decode(Task.self).flatMap { task in
            return task.save(on: request)
        }
    }
    
    func update(_ request: Request) throws -> Future<Task> {
        return try request.parameters.next(Task.self).flatMap({ task in
            return try request.content.decode(Task.self).flatMap { newTask in
                task.name = newTask.name
                task.description = newTask.description
                task.isResolved = newTask.isResolved
                
                return task.save(on: request)
            }
        })
    }
    
    func delete(_ request: Request) throws -> Future<HTTPStatus> {
        return try request.parameters.next(Task.self).flatMap { task in
            return task.delete(on: request)
        }.transform(to: .ok)
    }
}
