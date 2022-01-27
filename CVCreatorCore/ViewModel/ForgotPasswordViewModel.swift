//
//  ForgotPasswordViewModel.swift
//  CVCreatorCore
//
//  Created by Nathan on 18/11/2021.
//

import Foundation
public class ForgotPasswordViewModel: ObservableObject {
    
    public let navigationTitle = StringKeys.loginNavigationTitle
    
    public let emailTextFieldViewModel = CVCreatorTextFieldViewModel(
        textFieldType: .email
    )
    
    public init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
    }
    
    private let rootViewModel: RootViewModel
    
    public func goToMain() {
        rootViewModel.presentedRootViewType = .main
    }
}
