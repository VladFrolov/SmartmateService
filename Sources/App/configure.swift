import FluentSQLite
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    
    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    
    try services.register(FluentSQLiteProvider())
    
    var databases = DatabasesConfig()
    try databases.add(database: SQLiteDatabase(storage: .memory), as: .sqlite)
    services.register(databases)
    
    var migrations = MigrationConfig()
    migrations.add(model: Bookmark.self, database: .sqlite)
    migrations.add(model: Task.self, database: .sqlite)
    services.register(migrations)
}
