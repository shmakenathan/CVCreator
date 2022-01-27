//
//  TextFieldType.swift
//  CVCreatorCore
//
//  Created by Nathan on 20/01/2022.
//

import Foundation


public enum TextFieldType {
    case password
    case passwordConfirmation
    case email
    case username
    
    
    public var placeholder: String {
        switch self {
        case .password:
            return StringKeys.loginPasswordPlaceholder
        case .passwordConfirmation:
            return StringKeys.loginConfirmationPasswordPlaceholder
        case .email:
            return StringKeys.loginEmailPlaceholder
        case .username:
            return StringKeys.loginUsernamePlaceholder
        }
    }
    
    public var isSecured: Bool {
        switch self {
        case .password:
            return true
        case .passwordConfirmation:
            return true
        case .email:
            return false
        case .username:
            return false
        }
    }
}
