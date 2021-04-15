//
//  FlyoutNavMenu.swift
//  test
//
//  Created by Darren Hurst on 2021-04-05.
//
import SwiftUI

struct FlyoutNavMenuItem: Hashable {

    var title: String
    var systemName: String
    
    
    init(title: String, systemName: String){
        self.title = title
        self.systemName = systemName
    }
    
}

struct FlyoutNavMenu: View {
    
    var body: some View {
     
         
        let item:FlyoutNavMenuItem = FlyoutNavMenuItem(title: "Accounts", systemName: "briefcase")
        let item2:FlyoutNavMenuItem = FlyoutNavMenuItem(title: "Pay Bills", systemName: "arrow.right.arrow.left.square.fill")
        let item3:FlyoutNavMenuItem = FlyoutNavMenuItem(title: "Transfer Money", systemName: "arrow.right.square.fill")
        
        let navitem: ButtonItem = ButtonItem(image:"person", description_key: "Your Profile")
      
        let items:[FlyoutNavMenuItem] = [item,item2,item3]
        let navItems:[ButtonItem] = [navitem]
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading){
                ButtonNav(items: navItems).padding(.leading,70).padding(.top,60).padding(.bottom,20)
            }.background(Color.DarkGray)
            VStack {
                VStack(alignment: .leading)  {
                ForEach(items, id: \.self) { item in
                    HStack {
                        Image(systemName:item.systemName)
                            .foregroundColor(.black)
                            .imageScale(.medium)
                        Text(item.title)
                            .foregroundColor(.black)
                            .font(.Small)
                            .frame(alignment:.leading)
                       
                    }.frame(alignment:.center)
                }.padding(.top,15).background(Color.white)
                    Divider()
                }
            }.frame(alignment: .leading).padding(.leading,20)
            
                Spacer().background(Color.white)
         
                    
       
        
        }.frame(width:140,height:UIScreen.screenHeight, alignment: .leading)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
    
    }
    
}


struct FlyoutNavPreview: PreviewProvider {
    static var previews: some View {
      FlyoutNavMenu()
    }
}
