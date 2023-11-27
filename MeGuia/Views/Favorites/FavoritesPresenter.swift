import Foundation
import FirebaseFirestore

final class FavoritesPresenter: ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void) {
        var models: [CellModel] = []
            let collections = ["diversao", "restaurantes", "acomodacoes"]
            let db = Firestore.firestore()
                
            for collection in collections {
                db.collection(collection).getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error GETTING documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            guard let model = try? document.data(as: CellModel.self) else {
                                print("Error DECODING document!")
                                return
                            }
                            //lógica apenas favoritos
                            if (model.isFavorite == true) {
                                models.append(model)
                            }
                        }
                            
                        completion(.success(models))
                    }
                }
            }
    }
}
