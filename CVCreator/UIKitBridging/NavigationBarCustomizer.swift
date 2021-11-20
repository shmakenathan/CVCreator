//
//  NavigationBarCustomizer.swift
//  CVCreator
//
//  Created by Nathan on 18/11/2021.
//

import UIKit

final class NavigationBarCustomizer {
    static let shared = NavigationBarCustomizer()
    
    private init() { }
    
    func setupCustomNavigationBar() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemRed
        
        appearance.titleTextAttributes = [
            .foregroundColor : UIColor.white
        ]
        
        appearance.largeTitleTextAttributes = [
            .foregroundColor : UIColor.systemCyan,
            .font : UIFont.systemFont(ofSize: 20)
            //.font : UIFont(name: "", size: 20)
        ]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().tintColor = .white
        
    }
}
