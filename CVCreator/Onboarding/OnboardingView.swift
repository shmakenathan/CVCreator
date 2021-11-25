//
//  OnboardingView.swift
//  CVCreator
//
//  Created by Nathan on 21/10/2021.
//

import SwiftUI
import CVCreatorCore

struct OnboardingView: View {
    
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        OnboardingSlideView(
            viewModel: viewModel.selectedOnboardingSlideViewModel
        )
    }
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(
            viewModel: OnboardingViewModel(
                rootViewModel: RootViewModel()
            )
        )
    }
}
