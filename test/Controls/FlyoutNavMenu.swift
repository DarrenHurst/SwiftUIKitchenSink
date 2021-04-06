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
     
         
                let item:FlyoutNavMenuItem = FlyoutNavMenuItem(title: "Accounts", systemName: "person")
                
                let items:[FlyoutNavMenuItem] = [item, item, item]
        
        VStack(alignment: .leading) {
           
                ForEach(items, id: \.self) { item in
                  
                    HStack {
                        Image(systemName:item.systemName)
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text(item.title)
                            .foregroundColor(.gray)
                            .font(.TDSmall)
                    }.padding(.top, 30).frame(height:80)
                    
                }
                Spacer()
        } .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
        
        
    
    }
    
}
