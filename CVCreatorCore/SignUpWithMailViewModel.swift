//
//  SignUpWithMailViewModel.swift
//  CVCreatorCore
//
//  Created by Nathan on 18/11/2021.
//

import Foundation
public class SignUpWithMailViewModel: ObservableObject {
    
    public let navigationTitle = StringKeys.loginNavigationTitle
    
    public let userNameTextFieldViewModel = CVCreatorTextFieldViewModel(
        isSecured: false,
        placeholder: StringKeys.loginUsernamePlaceholder
    )
    public let emailTextFieldViewModel = CVCreatorTextFieldViewModel(
        isSecured: false,
        placeholder: StringKeys.loginPasswordPlaceholder
    )
    public let passwordTextFieldViewModel = CVCreatorTextFieldViewModel(
        isSecured: true,
        placeholder: StringKeys.loginPasswordPlaceholder
    )
    
    public let passwordConfimTextFieldViewModel = CVCreatorTextFieldViewModel(
        isSecured: true,
        placeholder: StringKeys.loginPasswordPlaceholder
    )
  
    
    
    public init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
    }
    
    private let rootViewModel: RootViewModel
    
    public func goToMain() {
        rootViewModel.presentedRootViewType = .main
    }
}
