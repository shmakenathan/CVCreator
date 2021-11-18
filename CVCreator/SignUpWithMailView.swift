//
//  SignUpWithMailView.swift
//  CVCreator
//
//  Created by Nathan on 18/11/2021.
//

import SwiftUI
import CVCreatorCore

struct SignUpWithMailView: View {
    @StateObject var viewModel: SignUpWithMailViewModel
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Hello")
                    .font(.title)
                    .fontWeight(.bold)
              
                
               userInformationTextFieldsSectionView
                Button {
                 
                } label: {
                    Text("Sign in").foregroundColor(.white)
                       
                }.padding().frame(maxWidth: .infinity).background(.black)
            }
            .padding(.horizontal, 15)
            .padding(.vertical)
            .navigationBarHidden(true)
        }
    }
    
    
    private var userInformationTextFieldsSectionView: some View {
        VStack(spacing: 30) {
            CVCreatorTextFieldView(viewModel: viewModel.userNameTextFieldViewModel)
            CVCreatorTextFieldView(viewModel: viewModel.emailTextFieldViewModel)
            CVCreatorTextFieldView(viewModel: viewModel.passwordTextFieldViewModel)
            CVCreatorTextFieldView(viewModel: viewModel.passwordConfimTextFieldViewModel)
        }
        .padding(.vertical)
    }
}
struct SignUpWithMailView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpWithMailView(viewModel: SignUpWithMailViewModel(
            rootViewModel: RootViewModel()))
    }
}
