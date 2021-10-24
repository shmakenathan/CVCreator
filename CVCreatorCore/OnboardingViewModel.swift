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
            title: "Test titl0 1",
            imageName: "circle",
            bodyText: "here is that",
            buttonTitle: "next"
        ),
        .init(
            title: "Test titl02",
            imageName: "circle",
            bodyText: "here is that adsidashihad",
            buttonTitle: "next"
        )
    
    ]
    
}
