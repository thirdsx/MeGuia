import Foundation

final class FunPresenter: ListPresenterProtocol {
    func getCells(completion: @escaping (Result<[CellModel], Error>) -> Void) {
        completion(
            .success(
                [
                    .init(
                        id: UUID(),
                        title: "Voo de Parapente",
                        description: "A proporciona uma vista aérea espetacular das praias, dunas e da paisagem costeira. Você poderá apreciar as cores vibrantes do mar, as formações geológicas únicas e toda a beleza natural da região de uma perspectiva única.",
                        imageURL: "defaultImage",
                        price: 400,
                        rating: 5,
                        isFavorite: false,
                        contact: "https://wa.me/5585997299103",
                        infos: [
                            .init(id: UUID(), iconName: "square.and.arrow.up", description: "20 minutos de duração"),
                            .init(id: UUID(), iconName: "square.and.arrow.up", description: "Voar com o instrutor"),
                            .init(id: UUID(), iconName: "square.and.arrow.up", description: "Instrutores certificados")
                        ]
                    )
                ]
            )
        )
    }
}
