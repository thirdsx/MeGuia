//
//  Double+.swift
//  MeGuia
//
//  Created by Yago Marques on 09/10/23.
//

import Foundation

extension Double {
    func currencyFormatting() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .init(identifier: "pt-BR")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        if let str = formatter.string(for: self) {
            return str
        } else { return "" }
    }
}
