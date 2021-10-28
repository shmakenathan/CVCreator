//
//  OnboardingViewModel.swift
//  CVCreatorCore
//
//  Created by Nathan on 21/10/2021.
//

import Foundation



public class OnboardingViewModel: ObservableObject {
    
    public init() {
        
    }
    
    
    public var selectedOnboardingSlide: OnboardingSlide {
        onboardingSlides[currentIndex]
    }
    
    
    @Published public var currentIndex = 0
    
    private let onboardingSlides: [OnboardingSlide] = [
        .init(
            title: "Creer votre CV en quelque seconde",
            imageName: "cv1",
            bodyText: "Plus besoin de galerer pour faire votre CV",
            buttonTitle: "Next"
        ),
        .init(
            title: "Plusieurs modele",
            imageName: "modele",
            bodyText: "Choisissez parmi un large choix de modele",
            buttonTitle: "Next"
        ),
        .init(
            title: "Faites la difference",
            imageName: "difference",
            bodyText: "Mettez toute vos chance de votre cote",
            buttonTitle: "S'inscrire"
        )
    
    ]
    
}
