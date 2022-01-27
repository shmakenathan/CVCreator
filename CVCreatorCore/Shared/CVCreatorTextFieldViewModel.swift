//
//  CVCreatorTextFieldViewModel.swift
//  CVCreatorCore
//
//  Created by Nathan on 04/11/2021.
//

import Foundation

public class CVCreatorTextFieldViewModel: ObservableObject, Identifiable {
    
    init(
        textFieldType: TextFieldType
    ) {
        self.textFieldType = textFieldType
    }
    
    public let id = UUID()
    
    public var isSecured: Bool {
        textFieldType.isSecured
    }
    
    public let textFieldType: TextFieldType
    
    public var placeholder: String {
        textFieldType.placeholder
    }
    
    @Published public var inputText: String = ""
}
