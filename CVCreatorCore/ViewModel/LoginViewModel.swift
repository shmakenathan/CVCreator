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

    
    
    public convenience init(
        rootViewModel: RootViewModel
    ) {
        self.init(
            rootViewModel: rootViewModel,
            authenticationService: AuthenticationService.shared
        )
    }
    
    init(
        rootViewModel: RootViewModel,
        authenticationService: AuthenticationServiceProtocol
    ) {
        self.rootViewModel = rootViewModel
        self.authenticationService = authenticationService
    }
  
    
    private func goToMain() {
        rootViewModel.presentedRootViewType = .main
    }
    
    public func login() {
        let username = userNameTextFieldViewModel.inputText
        let password = passwordTextFieldViewModel.inputText
        
        Task {
            do {
                if try await authenticationService.login(username: username, password: password) {
                    goToMain()
                }
            } catch {
                guard let error = error as? AuthenticationService.Error else { return }
                print("\(error) error ❌❌")
            }
        }
    }
    
    
    private let rootViewModel: RootViewModel
    private let authenticationService: AuthenticationServiceProtocol
}
