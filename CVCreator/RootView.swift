//
//  RootView.swift
//  CVCreator
//
//  Created by Nathan on 21/10/2021.
//

import SwiftUI
import CVCreatorCore

struct RootView: View {
    @StateObject var viewModel = RootViewModel()
    
    var body: some View {
        Group {
            switch viewModel.presentedRootViewType {
            case .onboarding:
                OnboardingView()
            case .login:
                LoginView()
            case .main:
                MainView()
            }
        }.environmentObject(viewModel)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
