import Foundation

struct CellModel: Identifiable, Decodable, Encodable {
    struct AdditionalInfo: Identifiable, Decodable, Encodable {
        let id: String
        let iconName: String
        let description: String
    }
    
    let id: String
    //let collection: String
    let title: String
    let description: String
    //let detailedDescription: String
    let imageURL: String
    let price: Double
    let rating: Double
    var isFavorite: Bool
    let contact: String
    let infos: [AdditionalInfo]
}
