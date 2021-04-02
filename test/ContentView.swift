//
//  ContentView.swift
//  test
//
//  Created by Darren Hurst on 2021-03-17.
//

import SwiftUI
import Combine


struct ContentView: View {

    @ObservedObject var formModel: FormModel
    var body: some View {
       
        NavigationView {
            LoginView(formModel: formModel)
        }.navigationTitle("").navigationBarHidden(true).background(Color.TDLightGray)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    @ObservedObject var formModel: FormModel
    static var previews: some View {
        ContentView(formModel: FormModel())
    }
}
