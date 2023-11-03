import Foundation
import FirebaseFirestore

final class FunPresenter: ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void) {
        let firestoreManager = FirestoreManager()
        firestoreManager.getCells(collectionName: "diversao", completion: completion)
    }
}
