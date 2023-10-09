//
//  ListCell.swift
//  MeGuia
//
//  Created by Yago Marques on 09/10/23.
//

import UIKit

final class ListCell: UITableViewCell {
    static let identifier = "PlaceTableViewCell"

    // MARK: UI Components
    private let backgroundShape: UIView = {
        let shape = UIView()
        shape.translatesAutoresizingMaskIntoConstraints = false
        shape.backgroundColor = .systemBackground
        shape.layer.cornerCurve = .circular
        shape.layer.cornerRadius = 10

        return shape
    }()

    private let placeImage: UIImageView = {
        let placeImage = UIImageView()
        placeImage.backgroundColor = .orange
        placeImage.layer.cornerCurve = .circular
        placeImage.layer.cornerRadius = 10
        placeImage.contentMode = .scaleAspectFill

        return placeImage
    }()

    private let placeTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.adjustsFontSizeToFitWidth = true

        return title
    }()

    private let placeDescription: UILabel = {
        let description = UILabel()
        description.numberOfLines = 0
        description.font = UIFont.systemFont(ofSize: 14)

        return description
    }()

    private let placeDuration: UILabel = {
        let duration = UILabel()
        duration.font = UIFont.systemFont(ofSize: 14)
        duration.adjustsFontSizeToFitWidth = true

        return duration
    }()

    private let placeDurationImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .orange

        return image
    }()

    private let placeAdditionaInfo: UILabel = {
        let additionalInfo = UILabel()
        additionalInfo.font = UIFont.systemFont(ofSize: 14)
        additionalInfo.adjustsFontSizeToFitWidth = true

        return additionalInfo
    }()

    private let placeAdditionaInfoImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .orange

        return image
    }()

    private let placeRating: UILabel = {
        let rating = UILabel()
        rating.textColor = .orange
        rating.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        return rating
    }()

    private let placeRatingImage: UIImageView = {
        let image = UIImageView()
        image.image = .init(systemName: "star")
        image.tintColor = .orange

        return image
    }()

    private let placePrice: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        return price
    }()

    // MARK: StackViews
    private let headerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10

        return stack
    }()

    private let titleAndDescriptionStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5

        return stack
    }()

    private let durationStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 3

        return stack
    }()

    private let additionalInfoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 3

        return stack
    }()

    private let ratingStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 3

        return stack
    }()

    private let durationAndPriceStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20

        return stack
    }()

    private let additionalInfoAndRatingStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20

        return stack
    }()

    private let generalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()

    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        buildLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    // MARK: Public methods
    public func configure(with cellModel: CellModel) {
        self.placeTitle.text = cellModel.title
        self.placeDescription.text = cellModel.description
        self.placePrice.text = cellModel.price.currencyFormatting()

        addAdditionalInfoIfNeeded(cellModel.infos)
        addRatingValue(cellModel.rating)
    }
}

private extension ListCell {
    // MARK: private methods
    func buildLayout() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }

    func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
    }

    func setupHierarchy() {
        addSubview(backgroundShape)
        addSubview(generalStackView)
        generalStackView.addArrangedSubview(headerStackView)
        headerStackView.addArrangedSubview(placeImage)
        headerStackView.addArrangedSubview(titleAndDescriptionStackView)
        titleAndDescriptionStackView.addArrangedSubview(placeTitle)
        titleAndDescriptionStackView.addArrangedSubview(placeDescription)
        generalStackView.addArrangedSubview(durationAndPriceStackView)
        durationAndPriceStackView.addArrangedSubview(durationStackView)
        durationStackView.addArrangedSubview(placeDurationImage)
        durationStackView.addArrangedSubview(placeDuration)
        durationAndPriceStackView.addArrangedSubview(placePrice)
        generalStackView.addArrangedSubview(additionalInfoAndRatingStackView)
        additionalInfoAndRatingStackView.addArrangedSubview(additionalInfoStackView)
        additionalInfoStackView.addArrangedSubview(placeAdditionaInfoImage)
        additionalInfoStackView.addArrangedSubview(placeAdditionaInfo)
        additionalInfoAndRatingStackView.addArrangedSubview(ratingStackView)
        ratingStackView.addArrangedSubview(placeRating)
        ratingStackView.addArrangedSubview(placeRatingImage)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundShape.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            backgroundShape.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            backgroundShape.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            backgroundShape.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

            generalStackView.topAnchor.constraint(equalTo: backgroundShape.topAnchor, constant: 10),
            generalStackView.leadingAnchor.constraint(equalTo: backgroundShape.leadingAnchor, constant: 15),
            generalStackView.trailingAnchor.constraint(equalTo: backgroundShape.trailingAnchor, constant: -15),
            generalStackView.bottomAnchor.constraint(equalTo: backgroundShape.bottomAnchor, constant: -10),

            placeImage.heightAnchor.constraint(equalToConstant: 80),
            placeImage.widthAnchor.constraint(equalToConstant: 120),

            placeDurationImage.widthAnchor.constraint(equalToConstant: 20),
            placeDurationImage.heightAnchor.constraint(equalToConstant: 20),

            placeAdditionaInfoImage.widthAnchor.constraint(equalToConstant: 20),
            placeAdditionaInfoImage.heightAnchor.constraint(equalToConstant: 20),

            placeRatingImage.heightAnchor.constraint(equalToConstant: 20),
            placeRatingImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }

    func addAdditionalInfoIfNeeded(_ additionalInfos: [CellModel.AdditionalInfo]?) {
        guard let additionalInfos else { return }

        for (index, additionalInfo) in additionalInfos.enumerated() {
            if index == 0 {
                self.placeDurationImage.image = .init(systemName: additionalInfo.iconName)
                self.placeDuration.text = additionalInfo.description
            } else if index == 1 {
                self.placeAdditionaInfoImage.image = .init(systemName: additionalInfo.iconName)
                self.placeAdditionaInfo.text = additionalInfo.description
            }
        }
    }

    func addTextWithSymbol(symbol: String, text: String) -> NSMutableAttributedString {
        let icon = NSTextAttachment()
        let image = UIImage(systemName: symbol)
        image?.withRenderingMode(.alwaysOriginal)
        icon.image = image
        icon.bounds = .init(x: 0, y: 0, width: 14, height: 14)

        let attributedText = NSMutableAttributedString()
        attributedText.append (NSAttributedString(attachment: icon))
        attributedText.append(.init(string: " \(text)"))

        return attributedText
    }

    func addRatingValue(_ value: Double) {
        let rating = String(value)
        self.placeRating.text = rating
    }
}

