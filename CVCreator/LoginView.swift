//
//  LoginView.swift
//  CVCreator
//
//  Created by Nathan on 21/10/2021.
//

import SwiftUI
import CVCreatorCore

struct LoginView: View {
    
    @StateObject var viewModel : LoginViewModel
    
    var body: some View {
        VStack{
            Spacer()
            Text("Bienvenue !").font(.largeTitle).fontWeight(.bold)
            Spacer()
            Text("Login with").padding()
                .multilineTextAlignment(.leading)
            HStack{
                Button {
                    
                } label: {
                    Image("fb").resizable()
                }
                Button {
                    
                } label: {
                 Image("google")
                }
                Button {
                    
                } label: {
                 Image("twitter")
                }

            }
            Text("Salut")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            viewModel: LoginViewModel(
                rootViewModel: RootViewModel()))
    }
}
