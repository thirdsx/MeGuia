import Foundation

final class AccommodationPresenter: ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void) {
        completion(.failure(NSError(domain: "Error", code: -1)))
    }
}
