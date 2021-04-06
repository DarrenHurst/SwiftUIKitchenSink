//
//  HeaderView.swift
//  test
//
//  Created by Darren Hurst on 2021-04-06.
//
import SwiftUI

struct HeaderView: View {
    @Binding var infoClicked: Bool
    @Binding var showMenu: Bool
 
    var body: some View {
    
    let columns = [
        GridItem(.flexible(minimum:30)),
   GridItem(.flexible(minimum:30)),
   GridItem(.flexible(minimum:30))
    ]
        
    VStack {
        NavigationLink(destination: SettingsView(), isActive:self.$infoClicked, label:{})
       // NavigationLink(destination: SettingsView(), isActive:$flyoutClicked, label:{})
   
    LazyVGrid(columns: columns, content: {
      
        Button(action:{ self.showMenu = true  },
                       label: {
            Image(systemName: "text.justify")
        })
       
                      
    .foregroundColor(Color.white)
    .frame(width: 50, height: 50, alignment: .leading)
 
    
    Image("Logo")
      .resizable()
        .frame(width: 33, height: 35, alignment: .center).fixedSize().fixedSize(horizontal: true, vertical: true)
 
      
    Button(action: {
            
            self.infoClicked = true
    
                }) {
                Image(systemName: "info")
                    .foregroundColor(.white).frame(width: 50.0, height: 50.0, alignment: .center)
    }
        
    }).frame(height:70)
       
    }.frame(height: 100, alignment: .center)
        
      
    }
}


struct HeaderViewPreview: PreviewProvider {
static var previews: some View {
    HeaderView(infoClicked: .constant(false), showMenu: .constant(false))
}
}
