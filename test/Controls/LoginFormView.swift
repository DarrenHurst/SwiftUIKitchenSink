//
//  SecureField.swift
//  test
//
//  Created by Darren Hurst on 2021-03-19.
//

import SwiftUI

struct LoginFormView: View {
    var bounce: Animation = Animation.default.repeatCount(5).speed(3)
    @State var offset: CGFloat = 0.0
    @State var selection: Int? = nil
    @Binding var showMenu: Bool 
    @ObservedObject var formModel: FormModel
    

    var body: some View {
      
        VStack.init(alignment: .center, spacing: 1.0, content: {
            
            Text("Username").padding(5.0).frame(width: 280.0, height: 30,alignment: .leading)
            
            TextField("Enter a Username", text: $formModel.username)
                .padding(5.0).frame(width: 280, height: 30,alignment: .leading)
           
            Text("Password").frame(width: 180, height: 30.0, alignment: .leading).padding(5.0).frame(width: 280, height: 30,alignment: .leading)
            
            
            SecureField("Enter a password", text: $formModel.password).frame(width: 280, height: 30,alignment: .leading)
            .offset(x: offset)  // amount to "shake"
            .animation(offset != 0 ? bounce:nil)
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            .padding(5.0)
            
            
            NavigationLink(destination: HomeView(), isActive: $formModel.showMain ) {}
            
                Button("Login",action: { // Process login
                  //Validate
                    formModel.buttonClicked = true
                    if !formModel.showMain {
                        clearPassword() // shows animation
                   }
                }).frame(width: 280.0, height: 33.0, alignment: .center)
            .padding(5.0)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(15.0)
                .font(.callout)
                
            
            Toggle("Remember Me", isOn: $formModel.rememberMe).padding(8).font(.footnote) .padding(10.0)
           
            
        }).frame(width: 310.0, height: 250.0, alignment: .top)
        .background(Color.init(.displayP3, red: 155.0, green: 155.0, blue: 155.0, opacity: 100.0))
        .border(Color.green)
        .cornerRadius(5.0)
        .padding(15.0)
        
       
    }
    
    func clearPassword() {
        if !formModel.showMain {
        offset = 20
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 0.5) {
            offset = 0
        }
        }
    }
        
      
}

