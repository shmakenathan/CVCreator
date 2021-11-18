//
//  ForgotView.swift
//  CVCreator
//
//  Created by Nathan on 18/11/2021.
//

import SwiftUI

struct ForgotPasswordView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Hello")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
               
              //  CVCreatorTextFieldView(viewModel: <#CVCreatorTextFieldViewModel#>)
            }
            .padding(.horizontal, 15)
            .padding(.vertical)
            .navigationBarHidden(true)
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
