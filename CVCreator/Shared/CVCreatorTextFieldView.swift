//
//  CVCreatorTextFieldView.swift
//  CVCreator
//
//  Created by Nathan on 04/11/2021.
//

import SwiftUI
import CVCreatorCore


struct CVCreatorTextFieldView: View {
    @ObservedObject var viewModel: CVCreatorTextFieldViewModel
    
    var body: some View {
        VStack {
            Group {
                if viewModel.isSecured {
                    SecureField(viewModel.placeholder, text: $viewModel.inputText)
                } else {
                    TextField(viewModel.placeholder, text: $viewModel.inputText)
                }
            }
            .textFieldStyle(PlainTextFieldStyle())
            .frame(height: 50)
            Divider()
        }
    }
}

