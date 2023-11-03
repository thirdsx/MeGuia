import Foundation

final class AccommodationPresenter: ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void) {
        let firestoreManager = FirestoreManager()
        firestoreManager.getCells(collectionName: "acomodacoes", completion: completion)
    }
}
