//
//  Router.swift
//  test
//
//  Created by Darren Hurst on 2021-04-15.
//
// Usage Example
// Router(isActive: $info, route: AnyView(SettingsView()), label: { _ in
// Text("Get an Account")
// })
//
//   or
//   Hidden Route
//   Router(isActive: $accountDetailRoute, route: AnyView(AccountDetails()), label: { _ in }).hidden().frame(width: 0, height: 0)
//


import Foundation
import SwiftUI

protocol RouterProtocol {
    var route: AnyView {get set}

}
struct Router<Content: View>: View, RouterProtocol {
    var route: AnyView
    @State var isActive: Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let label: Content

    init(route: AnyView, @ViewBuilder label:(()?) -> Content ) {
        self.route = route
        self.label = label(())
        
        self.isActive = isActive
    
    }
    
    var body: some View {
              NavigationLink(
            destination: route,
            isActive: $isActive,
            label: {
                label
            }
        ).navigationBarBackButtonHidden(true)
              .navigationBarItems(leading:
                                VStack {
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "arrowshape.turn.up.left.circle").foregroundColor(Color.white).frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    })
                                }.frame(height:44).foregroundColor(.white)
              ).ignoresSafeArea()
    }
}


