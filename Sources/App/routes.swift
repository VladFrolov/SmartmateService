import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    //MARK: - Bookmarks
    let bookmarksController = BookmarksContoller()
    router.get("bookmarks", use: bookmarksController.list)
    router.post("bookmarks", use: bookmarksController.create)
    router.patch("bookmarks", Bookmark.parameter,  use: bookmarksController.update)
    router.delete("bookmarks", Bookmark.parameter, use: bookmarksController.delete)
    
    //MARK: - Tasks
    let tasksController = TasksController()
    router.get("tasks", use: tasksController.list)
    router.post("tasks", use: tasksController.create)
    router.patch("tasks", Task.parameter, use: tasksController.update)
    router.delete("tasks", Task.parameter, use: tasksController.delete)
}
