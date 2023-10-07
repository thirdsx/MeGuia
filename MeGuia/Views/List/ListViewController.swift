import UIKit

protocol ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void)
}

final class ListViewController: UIViewController {
    private var cellModels: [CellModel] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let presenter: ListPresenterProtocol
    
    init(presenter: ListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Navigation View
        navigationItem.largeTitleDisplayMode = .always
        
        // Setup Table View
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        
        // Setup View
        view.backgroundColor = .systemBackground
        
        presenter.getCells { [weak self] result in
            switch result {
                case .success(let cellModels):
                    self?.cellModels = cellModels
                    self?.tableView.reloadData()
                case .failure:
                    print("Fazer tratativa para o cenário de error ❌")
            }
        }
    }
        
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: - Yago vai adicionar aqui a célula customizada
        let cell = cellModels[indexPath.row]
        let uiTableViewCell = UITableViewCell()
        uiTableViewCell.textLabel?.text = cell.title
        return uiTableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController(cellModel: cellModels[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
