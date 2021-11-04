//
//  LoginViewModel.swift
//  CVCreatorCore
//
//  Created by Nathan on 21/10/2021.
//

import Foundation


public class LoginViewModel: ObservableObject {
    
    public init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
    }
    
    private let rootViewModel: RootViewModel
    
    private func goToMain() {
        rootViewModel.presentedRootViewType = .main
    }
}
