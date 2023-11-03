import FirebaseFirestore
import Foundation

final class FirestoreManager {
    struct FirestoreError: Error { }
    
    func getCells(collectionName: String, completion: @escaping (Result<[CellModel], Error>) -> Void) {
        var models: [CellModel] = []
        let db = Firestore.firestore()
        
        db.collection(collectionName).getDocuments() { (querySnapshot, err) in
            if let err = err {
                completion(.failure(FirestoreError()))
            } else {
                for document in querySnapshot!.documents {
                    guard let model = try? document.data(as: CellModel.self) else {
                        completion(.failure(FirestoreError()))
                        return
                    }
                    
                    models.append(model)
                }
                
                completion(.success(models))
            }
        }
    }
}
