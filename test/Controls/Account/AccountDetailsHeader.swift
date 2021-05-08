//
//  AccountDetailsHeader.swift
//  test
//
//  Created by Darren Hurst on 2021-04-08.
//

import Foundation
import SwiftUI

struct AccountDetailsHeader: View {
    let items: [ButtonItem] = [
        ButtonItem(image: "book.fill", description_key: "Move Money"),
        ButtonItem(image: "dial.fill", description_key: "Activity")
        ]
    var body: some View {
        VStack {
        VStack.init(alignment: .center, content:  {
             ButtonNav(items: items)
                 .frame(width:UIScreen.screenWidth, height:75, alignment: .center)
                 //.padding(.leading, CGFloat(offsetWidth))
             
         })
         .padding(.top, 100)
         .padding(.bottom,20)
         .frame(height:100)
         .background(Color.blue).ignoresSafeArea()
   
         ScrollView {
             List {
                 VStack {
                     Text("Cash Accounts").font(.Large)
                 }
                 VStack {
                     HStack {
                         Text("Staff Account").font(.Medium)
                         Spacer()
                         Text("-23.55").padding(.trailing, 50).padding(.top, 15)
                     }
                 }.frame(width: UIScreen.screenWidth, height:40, alignment: .top)
                 VStack {
                     HStack {
                      
                         Router(route: AnyView(AccountDetails()), isChild:true, label: {_ in
                             Button(action: {
                                 //self.accountDetailRoute = true
                             }, label: {
                                 HStack {
                                 Text("American Express Card").font(.Medium).padding(.leading,4-10)
                                 Spacer()
                                 Text("1623.55").padding(.trailing,40).padding(.top, 15)
                             }
                         })
                          
                         
                         })
                     }
                 }.frame(width: UIScreen.screenWidth, alignment: .top)
                
                 VStack {
                     HStack {
                         
                         Router(route: AnyView(SettingsView()), isChild: true, label: { _ in
                             Text("Get an Account").font(.Medium).foregroundColor(Color.DarkGray)
                                 .padding(.top, 6)
                             //accenpts Tuple View
                             Text("NOW").font(.Medium).foregroundColor(Color.red)
                                 .padding(.top, 6)
                         }).frame(width: UIScreen.screenWidth)
                        
                        
                     }
                 }.frame(width: UIScreen.screenWidth, height:40, alignment: .top)
                
             }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight-40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
             //geometry add here for height..  or possible return UIScreen.fitHeight extension TODO
         }.frame(alignment: .leading)
        }
        
    }
}

struct AccountDetailsHeader_Preview: PreviewProvider {
    static var previews: some View {
        AccountDetailsHeader()
    }
}
