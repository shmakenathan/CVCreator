//
//  CVCreatorTextFieldViewModel.swift
//  CVCreatorCore
//
//  Created by Nathan on 04/11/2021.
//

import Foundation



public class CVCreatorTextFieldViewModel: ObservableObject, Identifiable {
    init(isSecured: Bool, placeholder: String) {
        self.isSecured = isSecured
        self.placeholder = placeholder
    }
    
    public let id = UUID()
    public let isSecured: Bool
    
    public let placeholder: String
    @Published public var inputText: String = ""
}
