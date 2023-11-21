import UIKit
import SwiftUI
import FirebaseFirestore

final class DetailViewController: UIViewController {
    private var cellModel: CellModel
    
    //FAVORITE BUTTON ------------------
    private var favoriteButton: UIBarButtonItem?
    //private var isFavorite = false
    private var favoriteImage: UIImage? {
        return UIImage(named: "heart" + (cellModel.isFavorite ? ".fill" : ""))
    }
    
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
        
        configureFavoriteButton()
        
        NSLayoutConstraint.activate([
            detailViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            detailViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureFavoriteButton() {
        favoriteButton = UIBarButtonItem(image: favoriteImage, style: .plain, target: self, action: #selector(touchedButton))
        favoriteButton?.tintColor = .orange
        navigationItem.rightBarButtonItem = favoriteButton
    }
    
    @objc func touchedButton() {
        //isFavorite = !isFavorite
        cellModel.isFavorite = !cellModel.isFavorite
        let db = Firestore.firestore()
        db.collection("diversao").document("rzy4xCai6H8duDbQ0uRZ").setData(["isFavorite" : cellModel.isFavorite], merge: true) { err in
            if let err = err {
                print("error writing document: \(err)")
            } else {
                print("document sucessfully written!")
            }
        }
        favoriteButton?.image = favoriteImage
    }
}
