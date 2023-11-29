import UIKit
import SwiftUI
import FirebaseFirestore

final class DetailViewController: UIViewController {
    private var cellModel: CellModel
    private var isFavorite = false
    
    init(cellModel: CellModel) {
        self.cellModel = cellModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never

        let detailViewController = UIHostingController(rootView: DetailView(cellModel: cellModel))
        view.addSubview(detailViewController.view)
        addChild(detailViewController)
        detailViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            detailViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            detailViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureFavoriteButton()
    }
    
    private func configureFavoriteButton() {
        do {
            let models = try UserDefaultsManager.getAll()
            if models.contains(where: { receivedModel in
                receivedModel.id == cellModel.id
            }) {
                isFavorite = true
            } else {
                isFavorite = false
            }
        } catch {
            isFavorite = false
        }
        
        let imageName = isFavorite ? "heart.fill" : "heart"
        let uiImage = UIImage(systemName: imageName)
        let favoriteButton = UIBarButtonItem(image: uiImage, style: .plain, target: self, action: #selector(touchedButton))
        favoriteButton.tintColor = .orange
        navigationItem.rightBarButtonItem = favoriteButton
    }
    
    @objc func touchedButton() {
        if isFavorite {
            let uiImage = UIImage(systemName: "heart")
            let favoriteButton = UIBarButtonItem(image: uiImage, style: .plain, target: self, action: #selector(touchedButton))
            favoriteButton.tintColor = .orange
            navigationItem.rightBarButtonItem = favoriteButton
            do {
                try UserDefaultsManager.remove(cellModel)
            } catch {
                print("Erro ao remvoer cellModel ❌")
            }
            
        } else {
            let uiImage = UIImage(systemName: "heart.fill")
            let favoriteButton = UIBarButtonItem(image: uiImage, style: .plain, target: self, action: #selector(touchedButton))
            favoriteButton.tintColor = .orange
            navigationItem.rightBarButtonItem = favoriteButton
            do {
                try UserDefaultsManager.save(cellModel)
            } catch {
                print("Erro ao slavar cellModel ❌")
            }
        }
    }
}
