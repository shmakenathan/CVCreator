//
//  OnboardingViewModel.swift
//  CVCreatorCore
//
//  Created by Nathan on 21/10/2021.
//

import Foundation



public class OnboardingViewModel: ObservableObject {
    
    // MARK: - PUBLIC
    
    // MARK: Public - Properties
    
    
    public var selectedOnboardingSlideViewModel: OnboardingSlideViewModel {
        onboardingSlideViewModels[currentSlideIndex]
    }
    
    
    
    // MARK: Public - Methods
    
    
    
    public init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
    }
    
   
    

    // MARK: - PRIVATE
    
    // MARK: Private - Properties
    
    private let rootViewModel: RootViewModel
    
    @Published private var currentSlideIndex = 0
    
    private lazy var onboardingSlideViewModels: [OnboardingSlideViewModel] = [
        .init(
            title: "Creer votre CV en quelque seconde",
            imageName: "cv1",
            bodyText: "Plus besoin de galerer pour faire votre CV",
            buttonTitle: "Next",
            action: { [weak self] in self?.incrementCurrentSlideIndex() }
        ),
        .init(
            title: "Plusieurs modele",
            imageName: "modele",
            bodyText: "Choisissez parmi un large choix de modele",
            buttonTitle: "Next",
            action: { [weak self] in self?.incrementCurrentSlideIndex() }
        ),
        .init(
            title: "Faites la difference",
            imageName: "difference",
            bodyText: "Mettez toute vos chance de votre cote",
            buttonTitle: "S'inscrire",
            action: { [weak self] in self?.goToLogin() }
        )
    
    ]
    
    
    // MARK: Private - Methods
    
    private func incrementCurrentSlideIndex() {
        currentSlideIndex = currentSlideIndex + 1
        
    }
    
    private func goToLogin() {
        rootViewModel.presentedRootViewType = .login
    }
    
}
