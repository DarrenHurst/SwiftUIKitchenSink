//
//  Accounts.swift
//  test
//
//  Created by Darren Hurst on 2021-04-08.
//

import Foundation
import SwiftUI


// protocols force unwrapped variables are optional
// passing any will generate a warning
// protocols define the contract.
protocol AccountsProtocol{
    var info: Bool! {get set}
    var menu: Bool {get set}
}
struct Accounts: View, AccountsProtocol {
    @State var info: Bool! = false
    @State var menu: Bool = false
    @State var accountDetailRoute: Bool = false
    
    var body: some View {
        let items: [ButtonItem] = [
            ButtonItem(image: "book.fill", description_key: "Move Money"),
            ButtonItem(image: "dial.fill", description_key: "Activity")
            ]
        let offsetWidth: Int =  Int(UIScreen.screenWidth)/2 + (items.count * 44 / 2) // 44 size of button item
        
        HStack.init(content: {
            VStack {
            VStack.init(alignment: .center, content:  {
                ButtonNav(items: items)
                    .frame(height:75, alignment: .center)
                    .padding(.leading, CGFloat(offsetWidth))
                .frame(width: UIScreen.screenWidth, height: 80, alignment: .top)
                
            })
            .padding(.top, 100)
            .padding(.bottom,20)
            .frame(height:100)
            .background(Color.blue)
      
            ScrollView {
                List {
                    VStack {
                        Text("Cash Accounts").font(.TDLarge)
                    }
                    VStack {
                        HStack {
                            Text("Staff Account").font(.TDMedium)
                            Spacer()
                            Text("-23.55").padding(.trailing, 50).padding(.top, 15)
                        }
                    }.frame(width: UIScreen.screenWidth, height:40, alignment: .top)
                    VStack {
                        HStack {
                            NavigationLink(
                                destination: AccountDetails(),
                                isActive: $accountDetailRoute,
                                label: {
                                    Button(action: {
                                        self.accountDetailRoute = true
                                        self.accountDetailRoute = false
                                    }, label: {
                                        HStack {
                                        Text("American Express Card").font(.TDMedium)
                                        Spacer()
                                        Text("1623.55").padding(.trailing,20).padding(.top, 15)
                                    }
                                    })
                                })
                        }
                    }.frame(width: UIScreen.screenWidth, alignment: .top)
                    VStack {
                        HStack {
                            Text("Get an Account").font(.TDMedium).foregroundColor(Color.TDDarkGray)
                                .padding(.top, 6)
                            Spacer()
                           
                        }
                    }.frame(width: UIScreen.screenWidth, height:40, alignment: .top)
                   
                }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                //geometry add here for height..  or possible return UIScreen.fitHeight extension TODO
            }.frame(alignment: .leading).background(Color.red)
            
            }

        }).background(Color.TDLightGray)
        .frame(width: UIScreen.screenWidth,height: UIScreen.screenHeight, alignment: .top).ignoresSafeArea()
        
    
    }
}

struct Accounts_Preview: PreviewProvider {
    static var previews: some View {
        Accounts()
    }
}

