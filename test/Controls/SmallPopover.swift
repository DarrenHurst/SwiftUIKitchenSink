//
//  SmallPopover.swift
//  test
//
//  Created by Darren Hurst on 2021-04-22.
//

import Foundation
import SwiftUI

struct SmallPopover : View {
    @Binding var isPresented : Bool // Bindable 
    
    @State var opacity: Double // internal state
    
    var body: some View {
        if(isPresented) {
        VStack {
          
            ListSample()
            
        }.frame(height:300, alignment: .bottom).opacity(opacity)
        .onAppear(perform: {
            self.opacity = 1.0
        })
           
        .onDisappear(perform: {
            self.opacity = 0.0
        })
        }
    }
}
