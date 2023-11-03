import Foundation

final class RestaurantsPresenter: ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void) {
        let firestoreManager = FirestoreManager()
        firestoreManager.getCells(collectionName: "restaurantes", completion: completion)
    }
}
