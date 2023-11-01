import Foundation
import FirebaseFirestore

final class FunPresenter: ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void) {
        var models: [CellModel] = []
        let db = Firestore.firestore()
        db.collection("diversao").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    guard let model = try? document.data(as: CellModel.self) else {
                        fatalError("Decode error")
                    }
                    models.append(model)
                }
                completion(.success(models))
            }
        }
    }
}
