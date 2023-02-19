//
//  Extension+String.swift
//  hwCounter
//
//  Created by Anthony on 19.02.2023.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString( self, tableName: "Localizable", value: self, comment: self)
    }
}
