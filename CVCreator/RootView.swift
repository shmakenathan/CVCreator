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
                OnboardingView(
                    viewModel: OnboardingViewModel(rootViewModel: viewModel)
                )
            case .login:
                LoginView(
                        viewModel: LoginViewModel(rootViewModel: viewModel))
            case .main:
                MainView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
