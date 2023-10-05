import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
        //self.tabBar.barTintColor = .systemOrange
        self.tabBar.tintColor = .systemOrange
        self.tabBar.backgroundColor = .white
        self.tabBar.unselectedItemTintColor = .systemGray
        
    }
    
    // MARK: - Tab Setup
    
    private func setupTabs() {
        let first = navCreate(title: "Diversão", image: UIImage(named: "iconeDiversao"), ViewController: FirstViewController())
        let second = navCreate(title: "Comer&Beber", image: UIImage(named: "iconeComerBeber"), ViewController: SecondViewController())
        let third = navCreate(title: "Hospedagem", image: UIImage(named: "iconeRelaxar"), ViewController: ThirdViewController())
        let fourth = navCreate(title: "Favoritos", image: UIImage(named: "iconeFavoritos"), ViewController: FourthViewController())
        
        // Para usar imagens fora do sistema, importar como asset e utilizar UIImage(named: "nome.da.imagem.como.foi.colocado")
        
        self.setViewControllers([first, second, third, fourth], animated: true)
    }
    
    private func navCreate(title: String, image: UIImage?, ViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: ViewController)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        
        nav.viewControllers.first?.navigationItem.title = title
        //nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: <#T##String?#>, image: <#T##UIImage?#>, target: <#T##AnyObject?#>, action: <#T##Selector?#>)
        
        return nav
    }
}
