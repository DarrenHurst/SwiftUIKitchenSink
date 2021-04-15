//
//  Router.swift
//  test
//
//  Created by Darren Hurst on 2021-04-15.
//
// Usage Example
// Router(isActive: $info, route: AnyView(SettingsView()), label: {
// Text("Get an Account").font(.Medium).foregroundColor(Color.DarkGray)
//    .padding(.top, 6)
// })
//

import Foundation
import SwiftUI

protocol RouterProtocol {
    var isActive: Binding<Bool> {get set}
   
}
struct Router<Content: View>: View, RouterProtocol {
    var isActive: Binding<Bool>
    
    let route: AnyView
    let label: Content

    init(isActive: Binding<Bool>, route: AnyView, @ViewBuilder label:(()?) -> Content ) {
        self.route = route
        self.isActive = isActive
        self.label = label(())
    }
    var body: some View {
        NavigationLink(
            destination: route,
            isActive: isActive,
            label: {
                label
            }
        )
    }
}


