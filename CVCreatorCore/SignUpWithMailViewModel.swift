//
//  SignUpWithMailViewModel.swift
//  CVCreatorCore
//
//  Created by Nathan on 18/11/2021.
//

import Foundation
public class SignUpWithMailViewModel: ObservableObject {
    
    public let navigationTitle = StringKeys.loginNavigationTitle
    
    public lazy var textFieldsViewModels: [CVCreatorTextFieldViewModel] = [
        userNameTextFieldViewModel,
        emailTextFieldViewModel,
        passwordTextFieldViewModel,
        passwordConfimTextFieldViewModel
    ]
    
    
    private let userNameTextFieldViewModel = CVCreatorTextFieldViewModel(
        isSecured: false,
        placeholder: StringKeys.loginUsernamePlaceholder
    )
    private let emailTextFieldViewModel = CVCreatorTextFieldViewModel(
        isSecured: false,
        placeholder: StringKeys.loginPasswordPlaceholder
    )
    private let passwordTextFieldViewModel = CVCreatorTextFieldViewModel(
        isSecured: true,
        placeholder: StringKeys.loginPasswordPlaceholder
    )
    
    private let passwordConfimTextFieldViewModel = CVCreatorTextFieldViewModel(
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
