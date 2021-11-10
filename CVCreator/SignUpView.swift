//
//  SignUpView.swift
//  CVCreator
//
//  Created by Nathan on 04/11/2021.
//

import SwiftUI
import CVCreatorCore

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                SocialNetworkButtonsGroupView(viewModel: viewModel.socialNetworkButtonsGroupViewModel)
                mainButtonsSectionView
                //CVCreatorTextFieldView(viewModel: viewModel.userNameTextFieldViewModel)
            }
            .padding(.horizontal, 20)
            .padding(.vertical)
            .navigationBarHidden(true)
        }
    }
    
    
    
    private var mainButtonsSectionView: some View {
        VStack {
            Button {
                
            } label: {
                Text("Email")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .foregroundColor(.white)
                    .background(.black)
            }
            Spacer()
            NavigationLink {
                SignUpView()
            } label: {
                Text("Login")
            }
            .foregroundColor(.black)
        }
    }

    
    
    
    
}




struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
 
