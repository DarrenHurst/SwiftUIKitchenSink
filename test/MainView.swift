//
//  MainView.swift
//  test
//
//  Created by Darren Hurst on 2021-04-02.
//

import SwiftUI
// MainView Tab bar
    struct MainView: View {
        var body: some View {
            TabView{
                HomeView().offset(y:-20).tabItem {
            Image(systemName: "heart.fill")
            Text("Home").navigationBarHidden(true).navigationBarBackButtonHidden(true)
                }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .top)
                
               SettingsView().offset(y:-20).tabItem {
                    Image(systemName: "doc.richtext")
                    Text("Settings").navigationBarHidden(true).navigationBarBackButtonHidden(true)
               }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .top)
               
            }
            
        }
    }
