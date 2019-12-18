import FluentPostgreSQL
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    
    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    
    try services.register(FluentPostgreSQLProvider())
    
    let postgreDataBase = PostgreSQLDatabaseConfig(
        hostname: "127.0.0.1",
        port: 5432,
        username: "vladislavfrolov",
        database: "SmartmateDataBase",
        password: nil)
    services.register(postgreDataBase)
    
    var migrations = MigrationConfig()
    migrations.add(model: Bookmark.self, database: .psql)
    migrations.add(model: Task.self, database: .psql)
    services.register(migrations)
}
