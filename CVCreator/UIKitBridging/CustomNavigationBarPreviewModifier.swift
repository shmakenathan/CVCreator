//
//  CustomNavigationBarPreviewModifier.swift
//  CVCreator
//
//  Created by Nathan on 18/11/2021.
//

#if DEBUG
import SwiftUI


extension View {
    func customNavigationBarPreviewModifier() -> some View {
        modifier(CustomNavigationBarPreviewModifier())
    }
}

struct CustomNavigationBarPreviewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .onAppear {
            NavigationBarCustomizer.shared.setupCustomNavigationBar()
        }
    }
}
#endif
