import Foundation

final class AccommodationPresenter: ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void) {
        completion(.success([.init(title: "Teste", description: "", imageURL: "", price: "", rating: 9, duration: nil, info: nil, isFavorite: false)]))
    }
}
