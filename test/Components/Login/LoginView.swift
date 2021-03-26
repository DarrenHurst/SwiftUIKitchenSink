//
//  LoginView.swift
//  test
//
//  Created by Darren Hurst on 2021-03-19.
//

import Foundation
import SwiftUI


public struct LoginView: View {
   
    @ObservedObject private var login = LoginViewModel.shared
    
    public var body: some View {
       
     
            VStack.init(alignment: .leading, spacing: 1.0, content: {
                Image("Logo").frame(width: 320.0, height: 50.0, alignment: .center).padding(25.0)
                
                    LoginFormView().padding(15)
                
                })
            .font(.footnote)
            .padding(2)
            
       
            .padding(EdgeInsets.init(top: 55.0, leading: 15.0, bottom: 5.0, trailing: 15.0))
            .frame(width: 280.0, height: 650.0, alignment: .top)
            }

    
}
