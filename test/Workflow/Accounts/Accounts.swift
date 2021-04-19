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
    var info: Bool {get set}
    var menu: Bool {get set}
}
struct Accounts: View, AccountsProtocol {
    @State var info: Bool = false
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
                         
                            Router(route: AnyView(AccountDetails()), label: {_ in })
                                .frame(width: 0, height: 0)
                            Button(action: {
                                //self.accountDetailRoute = true
                            }, label: {
                                HStack {
                                Text("American Express Card").font(.Medium).padding(.leading,4-10)
                                Spacer()
                                Text("1623.55").padding(.trailing,40).padding(.top, 15)
                            }
                            })
                        }
                    }.frame(width: UIScreen.screenWidth, alignment: .top)
                   
                    VStack {
                        HStack {
                            
                            Router(route: AnyView(SettingsView()), label: { _ in
                                Text("Get an Account").font(.Medium).foregroundColor(Color.DarkGray)
                                    .padding(.top, 6)
                                //accenpts Tuple View
                                Text("NOW").font(.Medium).foregroundColor(Color.red)
                                    .padding(.top, 6)
                            }).frame(width: UIScreen.screenWidth)
                           
                           
                        }
                    }.frame(width: UIScreen.screenWidth, height:40, alignment: .top)
                   
                }.standard()
                //geometry add here for height..  or possible return UIScreen.fitHeight extension TODO
            }.frame(alignment: .leading).background(Color.red)
            
            }

        }).standard().ignoresSafeArea()
        .transition(.slide)
    
    }
}

struct Accounts_Preview: PreviewProvider {
    static var previews: some View {
        Accounts()
    }
}

