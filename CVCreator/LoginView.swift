//
//  LoginView.swift
//  CVCreator
//
//  Created by Nathan on 21/10/2021.
//

import SwiftUI
import CVCreatorCore

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel

    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                VStack {
                    Text("Login with")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    SocialNetworkButtonsGroupView(viewModel: viewModel.socialNetworkButtonsGroupViewModel)
                    
                    Text("or")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    userInformationTextFieldsSectionView
                }
                
                Spacer()
                
                mainButtonsSectionView
                
            }
            .padding(.horizontal, 15)
            .padding(.vertical)
            .navigationTitle(viewModel.navigationTitle)
        }
        
        
    }
    
    
    
    
    private var userInformationTextFieldsSectionView: some View {
        VStack(spacing: 30) {
            CVCreatorTextFieldView(viewModel: viewModel.userNameTextFieldViewModel)
            CVCreatorTextFieldView(viewModel: viewModel.passwordTextFieldViewModel)
        }
        .padding(.vertical)
    }
    
    private var mainButtonsSectionView: some View {
        VStack {
            Button {
//                if viewModel.userNameTextFieldViewModel. .username == viewModel.password {
//                    viewModel.goToMain()
//                }
                
            } label: {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .foregroundColor(.white)
                    .background(.black)
            }
            NavigationLink {
                SignUpView()
            } label: {
                Text("Sign up")
            }
            .foregroundColor(.black)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            viewModel: LoginViewModel(
                rootViewModel: RootViewModel()
            )
        )
        .customNavigationBarPreviewModifier()
    }
}


