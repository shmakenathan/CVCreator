//
//  LoginViewModel.swift
//  CVCreatorCore
//
//  Created by Nathan on 21/10/2021.
//

import Foundation


public class LoginViewModel: ObservableObject {
    
    public let navigationTitle = StringKeys.loginNavigationTitle
    
    public let userNameTextFieldViewModel = CVCreatorTextFieldViewModel(
        isSecured: false,
        placeholder: StringKeys.loginUsernamePlaceholder
    )
    
    public let passwordTextFieldViewModel = CVCreatorTextFieldViewModel(
        isSecured: true,
        placeholder: StringKeys.loginPasswordPlaceholder
    )
    
    public let socialNetworkButtonsGroupViewModel = SocialNetworkButtonsGroupViewModel(optionType: .login)

    
    
    public init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
    }
    
    private let rootViewModel: RootViewModel
    
    public func goToMain() {
        rootViewModel.presentedRootViewType = .main
    }
}
