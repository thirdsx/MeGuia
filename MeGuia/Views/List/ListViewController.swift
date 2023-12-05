import UIKit

protocol ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void)
}

final class ListViewController: UIViewController {
    private var cellModels: [CellModel] = []
    private var filteredCellModels: [CellModel] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        return view
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
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        setupTableView()
        setupSpinner()
        
        // Setup View
        view.backgroundColor = .systemBackground
        
        // Setup SearchBar
        setupSearchBar()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        spinner.startAnimating()
        presenter.getCells { [weak self] result in
            self?.spinner.stopAnimating()
            switch result {
                case .success(let cellModels):
                    self?.cellModels = cellModels
                //CRIANDO UMA CÓPIA DO CELL MODELS P/ USAR A LISTA DE ELEMENTOS FILTRADOS
                    self?.filteredCellModels = cellModels
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
    
    private func setupSpinner() {
        view.addSubview(spinner)
        spinner.bringSubviewToFront(view)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupSearchBar() {
        // Configurando o searchController no navigationItem
        navigationItem.searchController = UISearchController()
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // Configurando a SearchBar do SearchController posicinado no navigationItem
        navigationItem.searchController?.searchBar.delegate = self
        navigationItem.searchController?.searchBar.sizeToFit()
        navigationItem.searchController?.searchBar.searchBarStyle = .minimal
        navigationItem.searchController?.searchBar.placeholder = "Pesquisar"
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier) as? ListCell else { return UITableViewCell() }
        //let cellModel = cellModels[indexPath.row]
        
        //PASSANDO A LISTA filteredCellModels como base de dados para a Table View
        let cellModel = filteredCellModels[indexPath.row]
        cell.configure(with: cellModel)

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return cellModels.count
        
        //CONTANDO A QUANTIDADE DE ELEMENTOS NA lista de elementos filtrados
        return filteredCellModels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController(cellModel: cellModels[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.filteredCellModels = []
        
        if searchText.isEmpty {
            self.filteredCellModels = self.cellModels
        } else {
            for experience in cellModels {
                if experience.title.lowercased().contains(searchText.lowercased()) {
                    filteredCellModels.append(experience)
                }
            }
        }
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
