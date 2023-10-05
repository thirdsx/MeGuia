import UIKit

final class FavoritesFactory {
    private init() { }
    
    static func make() -> UIViewController {
        let presenter = FavoritesPresenter()
        let viewController = ListViewController(presenter: presenter)
        return viewController
    }
}
