import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .systemOrange
        self.tabBar.backgroundColor = .systemBackground
        self.tabBar.unselectedItemTintColor = .systemGray
        
        setupTabs()
    }
    
    // MARK: - Tab Setup
    
    private func setupTabs() {
        let first = navCreate(title: "Diversão", image: UIImage(named: "diversaoIcone"), viewController: FunFactory.make())
        let second = navCreate(title: "Comer&Beber", image: UIImage(named: "comerBeberIcone"), viewController: RestaurantsFactory.make())
        let third = navCreate(title: "Hospedagem", image: UIImage(named: "relaxarIcone"), viewController: AccommodationFactory.make())
        let fourth = navCreate(title: "Favoritos", image: UIImage(named: "favoritosIcone"), viewController: FavoritesFactory.make())
        
        self.setViewControllers([first, second, third, fourth], animated: true)
    }
    
    private func navCreate(title: String, image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        nav.navigationBar.prefersLargeTitles = true
        viewController.tabBarItem.image = image
        viewController.title = title
        return nav
    }
}
