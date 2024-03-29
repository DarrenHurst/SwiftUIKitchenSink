//
//  HomeView.swift
//  test
//
//  Created by Darren Hurst on 2021-03-23.
//

import SwiftUI
import Combine

class testModel: ObservableObject {
    @Published var textField: String = ""
    @Published var secureField: String = ""
    @Published var textEditor: String = ""
    @Published var toggleField: Bool = false
    
    
    static let shared = testModel()
    init() {

    }
    
}

struct HomeView: View {
   
    //@ObservedObject private var model = testModel.shared
    
    /*@State var pickerOn: Bool = false
    @State var infoClicked: Bool = false
    @State var flyoutMenu: Bool = false
    @State var showMenu: Bool = false
    */
    @State var infoClicked: Bool = false
    @State var appeared: CGFloat = 1.0
    @State var showMenu: Bool = false

    let item: ButtonItem = ButtonItem(image:"mail", description_key: "Accounts")
    let item2: ButtonItem = ButtonItem(image:"doc.plaintext", description_key: "Transfers")
    let item3: ButtonItem = ButtonItem(image:"slider.horizontal.3", description_key: "Pay Bills")

    var body: some View {
        
    
        HStack {
           

            VStack {
                Color.blue
                     .ignoresSafeArea() // Ignore just for the color
                     
                HeaderView(infoClicked: $infoClicked, showMenu: $showMenu).frame(height:55).offset(y:15).ignoresSafeArea()
                
                    ButtonNav(items: [item,item2,item3])
                        .frame(height:80,alignment:.top).offset(y:-14).ignoresSafeArea()
                                   
            ScrollView {
                VStack.init(alignment: .center, spacing: nil, content: {
                    DashboardButton(text: "Accounts", height: 65).padding(0)
                    DashboardButton(text: "Crypto", height: 65).padding(0)
                        .frame(width: UIScreen.screenWidth) .background(Color.LightGray)
                })
               
            }.frame(height:UIScreen.screenHeight - 180).background(Color.LightGray).ignoresSafeArea()
                
               
               
        
            }.ignoresSafeArea()
            .navigationTitle("").navigationBarHidden(true)
        
      
        //left side button back
        //.animation(.linear(duration: 55), value: appeared)
       // .onAppear { appeared = 1.0}
        //.onDisappear { appeared = 0.0}
        //.offset(x: self.showMenu ? UIScreen.screenWidth/2 - 110 : 0)
        //.padding(.leading,self.showMenu ? 40 : 0)
        //.disabled(self.showMenu ? true : false)
       
       
          
        }.ignoresSafeArea()
        .background(Color.blue)
    
    }
    
}

struct HomeView_Previews: PreviewProvider {
static var previews: some View {
    HomeView()
}
}


