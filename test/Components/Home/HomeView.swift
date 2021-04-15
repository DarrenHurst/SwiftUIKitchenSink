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
    
    @State var pickerOn: Bool = false
    @State var infoClicked: Bool = false
    @State var flyoutMenu: Bool = false
    @State var showMenu: Bool = false
    
    
    let item: ButtonItem = ButtonItem(image:"mail", description_key: "Accounts")
    let item2: ButtonItem = ButtonItem(image:"doc.plaintext", description_key: "Transfers")
    let item3: ButtonItem = ButtonItem(image:"slider.horizontal.3", description_key: "Pay Bills")

    var body: some View {
        
       
        
        let drag = DragGesture()
                    .onEnded {
                        if $0.translation.width < -100 {
                            withAnimation {
                                self.showMenu = false
                            }
                        }
                    }
        HStack {
           
            if(self.showMenu) {
                FlyoutNavMenu().frame(width: 70, alignment: .leading).gesture(drag).offset(x:-25)
                     }
        NavigationView {
            
            VStack {
                Color.blue
                     .ignoresSafeArea() // Ignore just for the color
                     
                HeaderView(infoClicked: $infoClicked, showMenu: $showMenu).frame(height:88).offset(y:15).ignoresSafeArea()
                
                    ButtonNav(items: [item,item2,item3])
                        .frame(height:80,alignment:.top).padding(EdgeInsets(top: 0, leading: 55, bottom: 0, trailing: 0)).offset(y:-40).ignoresSafeArea()
                                   
            ScrollView {
                VStack.init(alignment: .center, spacing: nil, content: {
                    DashboardButton(text: "Accounts", height: 65).padding(0)
                    DashboardButton(text: "Crypto", height: 65).padding(0)
                        .frame(width: UIScreen.screenWidth) .background(Color.LightGray)
                })
               
            }.frame(height:UIScreen.screenHeight - 180).background(Color.LightGray)
                
               
                
            }.ignoresSafeArea()
            .background(Color.blue)
        }
        //left side button back
        .offset(x: self.showMenu ? UIScreen.screenWidth/2 - 110 : 0)
        .padding(.leading,self.showMenu ? 40 : 0)
        .disabled(self.showMenu ? true : false)
       
       
          
        }.ignoresSafeArea().background(Color.blue)
    
    }
    
}

struct HomeView_Previews: PreviewProvider {
static var previews: some View {
    HomeView()
}
}


