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
        
                let items:[FlyoutNavMenuItem] = [item, item2, item3]
        
        VStack(alignment: .leading) {
            HStack {
                Rectangle()
                    .fill(Color.green)
                    .background( LinearGradient(gradient: Gradient(colors: [.green, .black]), startPoint: .top, endPoint: .bottom))
                    .frame(width: UIScreen.screenWidth/2+35, height: 200, alignment: .top).offset(x:-20,y:-40)
                    
            }
                ForEach(items, id: \.self) { item in
                  
                    HStack {
                        Image(systemName:item.systemName)
                            .foregroundColor(.black)
                            .imageScale(.medium)
                        Text(item.title)
                            .foregroundColor(.black)
                            .font(.TDSmall)
                            .frame(width:UIScreen.screenWidth/2, alignment:.leading)
                    }.padding(.top, 10)
                    .padding(.bottom, 10)
                    .padding(.leading, 45)
                    .frame(width:UIScreen.screenWidth/2 - 40)
                    .scaledToFit()
                } .background(Rectangle().fill(Color.white).frame(width: UIScreen.screenWidth/2+20, height: 70, alignment: .center).cornerRadius(3.0)).offset(x:25,y:-30)
                Spacer().background(Color.white)
        } .padding(.leading,20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.TDLightGray)
        .edgesIgnoringSafeArea(.all)
        
        
    
    }
    
}


struct FlyoutNavPreview: PreviewProvider {
    static var previews: some View {
      FlyoutNavMenu()
    }
}
