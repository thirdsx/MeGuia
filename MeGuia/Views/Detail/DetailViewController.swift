import UIKit
import SwiftUI

final class DetailViewController: UIViewController {
    private let cellModel: CellModel
    
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
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem
        
        NSLayoutConstraint.activate([
            detailViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            detailViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
