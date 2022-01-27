//
//  SignUpView.swift
//  CVCreator
//
//  Created by Nathan on 04/11/2021.
//

import SwiftUI
import CVCreatorCore



struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: SignUpViewModel = SignUpViewModel()
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            userInformationTextFieldsSectionView
            Text("Get Started With") .frame(maxWidth: .infinity, alignment: .leading).padding(.vertical,10)
            //SocialNetworkButtonsGroupView(viewModel: viewModel.socialNetworkButtonsGroupViewModel)
         
            mainButtonsSectionView
            //CVCreatorTextFieldView(viewModel: viewModel.userNameTextFieldViewModel)
            Spacer()
            alreadySignedUpButtonView
        }
        //.alert(isPresented: $viewModel.isAlertPresented) {
            //Alert(title: Text("Erreur"),
            //      message: Text(viewModel.alertErrorType!.alertTitle),
            //      dismissButton:
            //        Alert.Button.cancel()
            //        )
            //)
            
            
        .alert(
            viewModel.alertErrorType?.alertTitle ?? "",
            isPresented: $viewModel.isAlertPresented,
            presenting: viewModel.alertErrorType) { alertErrorType in
        }
        
        .padding(.horizontal, 15)
        .padding(.vertical)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Sign Up")

        
    }
    
    
    private var userInformationTextFieldsSectionView: some View {
        
        VStack(spacing: 30) {
            ForEach(viewModel.textFieldsViewModels) {
                CVCreatorTextFieldView(viewModel: $0)
            }
        }
        .padding(.vertical)
    }
    
    private var mainButtonsSectionView: some View {
        VStack {
            Button {
                viewModel.submit()
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .foregroundColor(.white)
                        .background(.black)
                }
            }
            
        
        }
    }
    
    private var alreadySignedUpButtonView: some View {
        Button {
            dismiss()
        } label: {
            VStack {
                Text("Already onboard ?")
                Text("Login").foregroundColor(.red)
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical,10.0)
        }
        
    }
    
    
    
    
    
}




struct SignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            SignUpView(viewModel: SignUpViewModel())
        }
        .customNavigationBarPreviewModifier()
        
    }
}


