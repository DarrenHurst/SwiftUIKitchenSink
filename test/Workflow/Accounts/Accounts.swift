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
        //let offsetWidth: Int =  Int(UIScreen.screenWidth)/2 + (items.count * 44 / 2) // 44 size of button item
        
        HStack.init(content: {
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
            
                TDtabBar().frame(width: UIScreen.screenWidth, height: 24, alignment:.bottom)
                    .background(Color.white).offset(y:-60)
                
            }

        }).background(Color.clear)
        .frame(width: UIScreen.screenWidth,height: UIScreen.screenHeight, alignment: .top)
        .transition(.slide)
    
    }
}

struct Accounts_Preview: PreviewProvider {
    static var previews: some View {
        Accounts()
    }
}

