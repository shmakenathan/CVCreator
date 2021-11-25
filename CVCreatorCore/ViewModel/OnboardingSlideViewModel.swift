//
//  OnboardingSlideViewModel.swift
//  CVCreatorCore
//
//  Created by Nathan on 21/10/2021.
//

import Foundation


public class OnboardingSlideViewModel: ObservableObject {
    public init(
        title: String,
        imageName: String,
        bodyText: String,
        buttonTitle: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.imageName = imageName
        self.bodyText = bodyText
        self.buttonTitle = buttonTitle
        self.action = action
    }
    
    public let title: String
    public let imageName: String
    public let bodyText: String
    public let buttonTitle: String
    
    public let action: () -> Void
}
