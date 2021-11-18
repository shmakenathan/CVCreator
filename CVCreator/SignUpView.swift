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
                Text("CVCreator")
                    .font(.title)
                    .fontWeight(.bold)
             
                Text("Get Started With") .frame(maxWidth: .infinity, alignment: .leading).padding(.vertical,10)
                SocialNetworkButtonsGroupView(viewModel: viewModel.socialNetworkButtonsGroupViewModel)
                Text("Get Started With") .frame(maxWidth: .infinity, alignment: .leading).padding(.vertical,10)
                mainButtonsSectionView
                //CVCreatorTextFieldView(viewModel: viewModel.userNameTextFieldViewModel)
            }
            .padding(.horizontal, 15)
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
            
            NavigationLink {
                SignUpView()
            } label: {
                Text("Already onboard ?")
                Text("Login").foregroundColor(.red)
            }.foregroundColor(.black).frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical,10.0)
        }
    }
    
    
    
    
    
}




struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

