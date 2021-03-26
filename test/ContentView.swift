//
//  ContentView.swift
//  test
//
//  Created by Darren Hurst on 2021-03-17.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        NavigationView {
            LoginView()
        }.navigationTitle("").navigationBarHidden(true)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
