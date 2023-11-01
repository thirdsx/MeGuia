import Foundation

struct CellModel: Identifiable, Decodable {
    struct AdditionalInfo: Identifiable, Decodable {
        let id: String
        let iconName: String
        let description: String
    }
    
    let id: String
    let title: String
    let description: String
    let imageURL: String
    let price: Double
    let rating: Double
    let isFavorite: Bool
    let contact: String
    let infos: [AdditionalInfo]
}
