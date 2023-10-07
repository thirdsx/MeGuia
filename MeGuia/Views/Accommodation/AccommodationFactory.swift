import UIKit

final class AccommodationFactory {
    private init() { }
    
    static func make() -> UIViewController {
        let presenter = AccommodationPresenter()
        let viewController = ListViewController(presenter: presenter)
        return viewController
    }
}

