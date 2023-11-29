import Foundation

struct UserDefaultsError: Error { }

final class UserDefaultsManager {
    static let key = "favorites"
    
    static func getAll() throws -> [CellModel] {
        let jsonDecoder = JSONDecoder()
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        let models = try jsonDecoder.decode([CellModel].self, from: data)
        return models
    }
    
    static func save(_ cellModel: CellModel) throws {
        var cellModels = try getAll()
        cellModels.append(cellModel)
        let jsonEncoder = JSONEncoder()
        let data = try jsonEncoder.encode(cellModels)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    static func remove(_ cellModel: CellModel) throws {
        var cellModels = try getAll()
        cellModels.removeAll(where: { receivedModel in
            receivedModel.id == cellModel.id
        })
        let jsonEncoder = JSONEncoder()
        let data = try jsonEncoder.encode(cellModels)
        UserDefaults.standard.set(data, forKey: key)
    }
}
