//
//  ForgotView.swift
//  CVCreator
//
//  Created by Nathan on 18/11/2021.
//

import SwiftUI
import CVCreatorCore

struct ForgotPasswordView: View {
    
    @StateObject var viewModel: ForgotPasswordViewModel
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text("Mot de passe oublié ?")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                CVCreatorTextFieldView(viewModel: viewModel.emailTextFieldViewModel)
                Spacer()
                Button {
                    
                } label: {
                    Text("Password").foregroundColor(.white)
                    
                }.padding().frame(maxWidth: .infinity).background(.black)
            }
            .padding(.horizontal, 15)
            .padding(.vertical)
            .navigationBarHidden(true)
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(viewModel: ForgotPasswordViewModel(
            rootViewModel: RootViewModel()
        ))
    }
}
