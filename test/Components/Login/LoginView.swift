//
//  LoginView.swift
//  test
//
//  Created by Darren Hurst on 2021-03-19.
//

import Foundation
import SwiftUI


public struct LoginView: View {
    
    
    var login = LoginViewModel()
    @ObservedObject var formModel: FormModel
    
    public var body: some View {
       

        VStack.init(alignment: .leading, spacing: 1.0, content: {
                Image("Logo").frame(width: 320.0, height: 50.0, alignment: .center).padding(25.0)
            LoginFormView(formModel: formModel).padding(15)
            Text("Username: Test Password: abce").foregroundColor(.black).padding(5).font(.footnote).frame(width: 280.0, height: 33.0, alignment: .topLeading).position(x: 185.0, y: 0.0)
            TextField(formModel.passwordMessage, text:$formModel.passwordMessage).foregroundColor(.red).padding(5).font(.footnote).frame(width: 280.0, height: 33.0, alignment: .topLeading).position(x: 185.0, y: -20.0)
            Spacer()
            TextField(formModel.usernameMessage, text:$formModel.usernameMessage).foregroundColor(.red).padding(5).font(.footnote).frame(width: 280.0, height: 33.0, alignment: .topLeading).position(x: 185.0, y: -57.0)
              
                })
            .font(.footnote)
            .padding(2)
            
       
           .padding(5.0)
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .top)
            }

    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(formModel: FormModel())
    }
}

