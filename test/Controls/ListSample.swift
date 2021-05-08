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
        ZStack {
     
            VStack {
                HStack {
                Text("Cash Accounts").font(.Large).frame(width: UIScreen.screenWidth, alignment: .leading)
                }
                HStack {
                    Text("Staff Account").font(.Medium)
                    Spacer()
                    Text("-23.55").padding(.trailing, 50).padding(.top, 15)
                }
          
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
            
                HStack {
                    
                    Router(route: AnyView(SettingsView()), isChild: true, label: { _ in
                        Text("Get an Account").font(.Medium).foregroundColor(Color.DarkGray)
                            .padding(.top, 6)
                        //accenpts Tuple View
                        Text("NOW").font(.Medium).foregroundColor(Color.red)
                            .padding(.top, 6)
                    }).frame(width: UIScreen.screenWidth)
                   
                   
                }
            }
            .standard().padding(.leading, 33)
           
        }
        .standard()
        
    }
}

struct ListSamplePreview: PreviewProvider {
    static var previews: some View {
        ListSample()
    }
}
