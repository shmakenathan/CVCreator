//
//  LoginView.swift
//  CVCreator
//
//  Created by Nathan on 21/10/2021.
//

import SwiftUI
import CVCreatorCore

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        Text("Login View")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
