import Foundation

final class FavoritesPresenter: ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void) {
        let firestoreManager = FirestoreManager()
        firestoreManager.getCells(collectionName: "favoritos", completion: completion)
    }
}
