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
protocol AccountDetailsProtocol{
    var info: Bool! {get set}
    var menu: Bool {get set}
}
struct AccountDetails: View, AccountDetailsProtocol {
    @State var info: Bool! = false
    @State var menu: Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                    .font(Font.Large).padding(.bottom, 16).offset(y:-7)
                Text("Balance: $3244.33")
                    .foregroundColor(Color.white)
                    .font(Font.Large).padding(.bottom, 15)
                        
                ButtonNav(items: items)
                    .frame(height:75, alignment: .center)
                    .padding(.leading, CGFloat(offsetWidth))
                .frame(width: UIScreen.screenWidth, alignment: .top)
                
                FlatMenuBar { () -> Void? in
                    NSLog("Action1")
                } action2: { () -> Void? in
                    return
                } action3: { () -> Void? in
                    return
                }.frame(height:100)
                
            })
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    VStack {
                                        Button(action: {
                                            presentationMode.wrappedValue.dismiss()
                                        }, label: {
                                            Image(systemName: "arrowshape.turn.up.left.circle").foregroundColor(Color.white).frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        })
                                    }
            ).offset(y:63)
            .padding(.bottom, 24)
            .background(Color.blue)
          
        
            ScrollView {
                List {
                    VStack {
                        Text("April 8, 2021").font(.Large)
                    }
                    VStack {
                        HStack {
                            Text("PETRO CANADA").font(.Small)
                            Spacer()
                            Text("-23.55").padding(.trailing, 50).padding(.top, 15)
                        }
                    }.frame(width: UIScreen.screenWidth, height:40, alignment: .top)
                    VStack {
                        HStack {
                            Text("PAYROLL").font(.Small)
                            Spacer()
                            Text("1623.55").padding(.trailing, 50).padding(.top, 15).foregroundColor(.blue)
                        }
                    }.frame(width: UIScreen.screenWidth, height:40, alignment: .top)
                    VStack {
                        HStack {
                            Text("PETRO CANADA").font(.Small)
                            Spacer()
                            Text("-23.55").padding(.trailing, 50).padding(.top, 15)
                        }
                    }.frame(width: UIScreen.screenWidth, height:40, alignment: .top)
                   
                }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .top)
            }.frame(alignment: .top).padding(.bottom, 44)
            
                Spacer()
            }

        })
        .frame(width: UIScreen.screenWidth, alignment: .top).ignoresSafeArea()
        
    
    }
}

struct AccountsDetails_Preview: PreviewProvider {
    static var previews: some View {
        AccountDetails()
    }
}

