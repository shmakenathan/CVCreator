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
        HStack {
            Button {
                
            } label: {
                Image("google")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Button {
                
            } label: {
                Image("google")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Button {
                
            } label: {
                Image("t")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.padding(20).frame(width: 85,height: 60).background(Color(red: -0.31, green: 0.679, blue: 0.946)).cornerRadius(20).shadow(color: .gray, radius: 2, x: 0, y: 2)
            Button {
                
            } label: {
                Image("facebook")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.padding().background(Color(red: 0.233, green: 0.348, blue: 0.594)).overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 0.1))
                
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
