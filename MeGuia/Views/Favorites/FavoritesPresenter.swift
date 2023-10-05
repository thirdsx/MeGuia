import Foundation

final class FavoritesPresenter: ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void) {
        completion(.success([.init(title: "Teste", description: "", imageURL: "", price: "", rating: 9, duration: nil, info: nil, isFavorite: false)]))
    }
}
