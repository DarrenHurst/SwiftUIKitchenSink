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
    
        //let offsetWidth: Int =  Int(UIScreen.screenWidth)/2 + (items.count * 44 / 2) // 44 size of button item
        
        HStack.init(content: {
            ZStack {
           
                
                AccountDetailsHeader().standard()
                
                TDtabBar().frame(width: UIScreen.screenWidth, alignment:.bottom).ignoresSafeArea()
                
             
            }

        }).background(Color.clear)
        .frame(width: UIScreen.screenWidth,height: UIScreen.screenHeight, alignment: .top)
        .transition(.slide)
        .ignoresSafeArea()
    
    }
}

struct Accounts_Preview: PreviewProvider {
    static var previews: some View {
        Accounts()
    }
}

