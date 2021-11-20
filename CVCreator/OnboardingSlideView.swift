//
//  OnboardingSlideView.swift
//  CVCreator
//
//  Created by Nathan on 28/10/2021.
//

import SwiftUI
import CVCreatorCore

struct OnboardingSlideView: View {
    @ObservedObject var viewModel: OnboardingSlideViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(viewModel.imageName)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                Spacer()
                Text(viewModel.bodyText)
                    .font(.body)
                    .multilineTextAlignment(.center)
                Spacer()
                
                Button {
                    viewModel.action()
                } label: {
                    Text(viewModel.buttonTitle)
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.white)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .padding(.vertical, 10)
                }
                
            }
            .padding(.horizontal, 10)
            .navigationTitle(viewModel.title)
        }
        
    }
}
