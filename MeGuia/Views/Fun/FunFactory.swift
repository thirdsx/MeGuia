import UIKit

final class FunFactory {
    private init() { }
    
    static func make() -> UIViewController {
        let presenter = FunPresenter()
        let viewController = ListViewController(presenter: presenter)
        return viewController
    }
}
