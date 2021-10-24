//
//  OnboardingSlide.swift
//  CVCreatorCore
//
//  Created by Nathan on 21/10/2021.
//

import Foundation


public struct OnboardingSlide {
    public init(title: String, imageName: String, bodyText: String, buttonTitle: String) {
        self.title = title
        self.imageName = imageName
        self.bodyText = bodyText
        self.buttonTitle = buttonTitle
    }
    
    public let title: String
    public let imageName: String
    public let bodyText: String
    public let buttonTitle: String
}
