//
//  Onboarding.swift
//  test
//
//  Created by Darren Hurst on 2021-05-07.
//

import Foundation
import SwiftUI

struct OnboardingWorkflow : View {
    @State var page1: Bool = true
    @State var page2: Bool = false
    
    
    
    var body: some View {
        ZStack {
            PageView(presented: $page1,
                     backgroundColor: Color.red,
                     page:  AnyView(OnboardPage1(presented: $page1){
                        self.page2 = true
                     }
                                        .frame(width: 100, height: UIScreen.screenHeight, alignment: .bottom )), Action: {
                                            self.page2 = true
                                            self.page1 = false
                                        })
                     
            PageView(presented: $page2, backgroundColor: Color.blue, page:  AnyView(OnboardPage2(presented: $page2){
                self.page1 = true
            }.frame(width: 100, height: UIScreen.screenHeight, alignment: .bottom)
            ), Action: {
                self.page1 = true
                self.page2 = false
            })
           
        }
    }
}

struct OnboardingPreView : PreviewProvider {
    static var previews: some View {
        OnboardingWorkflow()
    }
}
