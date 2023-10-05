struct CellModel {
    struct AdditionalInfo {
        let iconName: String
        let description: String
    }
    
    let title: String
    let description: String
    let imageURL: String
    let price: String
    let rating: Double
    let duration: String?
    let info: AdditionalInfo?
    let isFavorite: Bool
}
