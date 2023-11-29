import Foundation
import FirebaseFirestore

struct FavoritesError: Error { }

final class FavoritesPresenter: ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void) {
        do {
            let models = try UserDefaultsManager.getAll()
            completion(.success(models))
        } catch {
            completion(.failure(FavoritesError()))
        }
    }
}
