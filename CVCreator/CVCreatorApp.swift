//
//  CVCreatorApp.swift
//  CVCreator
//
//  Created by Nathan on 21/10/2021.
//

import SwiftUI

@main
struct CVCreatorApp: App {

    init() {
        NavigationBarCustomizer.shared.setupCustomNavigationBar()
    }
   
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
