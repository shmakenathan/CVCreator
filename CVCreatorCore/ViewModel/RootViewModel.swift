//
//  RootViewModel.swift
//  CVCreatorCore
//
//  Created by Nathan on 21/10/2021.
//

import Foundation


public enum RootViewType {
    case onboarding
    case login
    case main
}


public class RootViewModel: ObservableObject {
    
    public init() {
        
    }
    
    
    @Published public var presentedRootViewType: RootViewType = .onboarding
    
}
