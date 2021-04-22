//
//  List.swift
//  test
//
//  Created by Darren Hurst on 2021-04-22.
//

import Foundation
import SwiftUI

struct ListSample: View {
    var body: some View {
        VStack {
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
           
        }.frame(width: UIScreen.screenWidth, height: 300)
        }
    }
}

struct ListSamplePreview: PreviewProvider {
    static var previews: some View {
        ListSample()
    }
}
