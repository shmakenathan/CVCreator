//
//  MainView.swift
//  CVCreator
//
//  Created by Nathan on 21/10/2021.
//

import SwiftUI
import CVCreatorCore

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        Text("Main View")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
