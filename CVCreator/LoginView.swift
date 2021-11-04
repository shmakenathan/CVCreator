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
    @State var username : String = ""
    @State var password : String = ""
    var body: some View {
        VStack{
            Spacer()
            Text("Bienvenue !").font(.largeTitle).fontWeight(.bold)
            
            Text("Login with").padding()
                .multilineTextAlignment(.leading)
            HStack(spacing: 30.0){
                Button {
                    
                } label: {
                    Image("facebook").resizable().aspectRatio( contentMode: .fit
                    )
                }
                Button {
                    
                } label: {
                    Image("google").resizable().aspectRatio( contentMode: .fit)
                }
                Button {
                    
                } label: {
                    Image("twitter").resizable().aspectRatio( contentMode: .fit)
                }
                
            }.padding(.horizontal, 45.0)
            Text("or")
            TextField("username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Divider()
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Divider()
        
            Button {
                if username == password {
                    viewModel.goToMain()
                }
                
            } label: {
                Text("Login").frame( maxWidth: .infinity).padding().foregroundColor(.white).background(.black).padding(.horizontal, 30.0
                )
            }
           // Text("Sign up")
         
        }.padding()
        
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            viewModel: LoginViewModel(
                rootViewModel: RootViewModel()))
    }
}
