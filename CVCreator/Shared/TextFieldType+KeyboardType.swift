//
//  TextFieldType+KeyboardType.swift
//  CVCreator
//
//  Created by Nathan on 20/01/2022.
//

import SwiftUI
import CVCreatorCore



extension TextFieldType {
    var associatedKeyboardType: UIKeyboardType {
        switch self {
        case .password:
            return .asciiCapable
        case .passwordConfirmation:
            return .asciiCapable
        case .email:
            return .emailAddress
        case .username:
            return .asciiCapable
        }
    }
}
