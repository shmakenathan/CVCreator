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
        VStack {
            Text(viewModel.selectedOnboardingSlide.title)
                .font(.headline)
            Spacer()
            Image(systemName: "circle")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            Spacer()
            Text("Create your own CV in a minute by filling forms")
                .font(.body)
            Spacer()
            
            Button {
                print(" tapped next")
                viewModel.currentIndex += 1
            } label: {
                Text("Next")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
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
