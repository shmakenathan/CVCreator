//
//  String+Localizable.swift
//  CVCreator
//
//  Created by Nathan on 04/11/2021.
//

import Foundation


extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
