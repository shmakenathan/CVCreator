//
//  OnboardingView.swift
//  CVCreator
//
//  Created by Nathan on 21/10/2021.
//

import SwiftUI
import CVCreatorCore

struct OnboardingView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        OnboardView(valeur: $viewModel.currentIndex, title: viewModel.selectedOnboardingSlide.title, image: viewModel.selectedOnboardingSlide.imageName, buttonBody: viewModel.selectedOnboardingSlide.buttonTitle, explication: viewModel.selectedOnboardingSlide.bodyText)
    }
}
    
    struct OnboardView: View {
        @Binding var valeur: Int
        var title: String
        var image: String
        var buttonBody: String
        var explication: String
        
        var body: some View {
            VStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Image(image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                Spacer()
                Text(explication)
                    .font(.body)
                    .multilineTextAlignment(.center)
                Spacer()
                
                Button {
                    print(" tapped next")
                    valeur = valeur+1
                } label: {
                    Text(buttonBody)
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
            
        }
    }
    
    
    
    
    
    
    
    
    
    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView()
        }
    }
