//
//  Accounts.swift
//  test
//
//  Created by Darren Hurst on 2021-04-08.
//

import Foundation
import SwiftUI

struct Accounts: View {
    
    @State var info: Bool = false
    @State var menu: Bool = false
    
    var body: some View {
        let items: [ButtonItem] = [
            ButtonItem(image: "book.fill", description_key: "Move Money"),
            ButtonItem(image: "dial.fill", description_key: "Activity")
            ]
        let offsetWidth: Int =  Int(UIScreen.screenWidth)/2 + (items.count * 44 / 2) // 44 size of button item
        
        HStack.init(content: {
            VStack {
            VStack.init(alignment: .center, content:  {
            
                
                Text("ACCOUNT: STAFF ACCOUNT")
                    .foregroundColor(Color.white)
                    .font(Font.TDLarge).padding(.bottom, 15)
                Text("Balance: $3244.33")
                    .foregroundColor(Color.white)
                    .font(Font.TDLarge).padding(.bottom, 15)
                        
                ButtonNav(items: items)
                    .frame(height:75, alignment: .center)
                    .padding(.leading, CGFloat(offsetWidth))
                .frame(width: UIScreen.screenWidth, height: 80, alignment: .top)
                
                FlatMenuBar { () -> Void? in
                    NSLog("Action1")
                } action2: { () -> Void? in
                    return
                } action3: { () -> Void? in
                    return
                }
                
            })
            .padding(.top, 100)
            .frame(height:400)
            .background(Color.green)
          Spacer()
            
            ScrollView {
                List {
                    VStack {
                        Text("April 8, 2021").font(.TDLarge)
                    }
                    VStack {
                        HStack {
                            Text("PETRO CANADA").font(.TDSmall)
                            Spacer()
                            Text("-23.55").padding(.trailing, 50).padding(.top, 15)
                        }
                    }.frame(width: UIScreen.screenWidth, height:40, alignment: .top)
                    VStack {
                        HStack {
                            Text("PAYROLL").font(.TDSmall)
                            Spacer()
                            Text("1623.55").padding(.trailing, 50).padding(.top, 15).foregroundColor(.green)
                        }
                    }.frame(width: UIScreen.screenWidth, height:40, alignment: .top)
                    VStack {
                        HStack {
                            Text("PETRO CANADA").font(.TDSmall)
                            Spacer()
                            Text("-23.55").padding(.trailing, 50).padding(.top, 15)
                        }
                    }.frame(width: UIScreen.screenWidth, height:40, alignment: .top)
                   
                }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }.frame(height:500, alignment: .leading).background(Color.red)
            
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

