import Foundation

struct CellModel: Identifiable {
    struct AdditionalInfo: Identifiable {
        let id: UUID
        let iconName: String
        let description: String
    }
    
    let id: UUID
    let title: String
    let description: String
    let imageURL: String
    let price: Double
    let rating: Double
    let isFavorite: Bool
    let contact: String
    let infos: [AdditionalInfo]
}
