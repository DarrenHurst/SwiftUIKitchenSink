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
    var isChild: Bool {get set}
   

}
struct Router<Content: View>: View, RouterProtocol {
    var route: AnyView
    var isChild: Bool = true
    var label: Content
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var appeared: Double = 0
    @State var o: Double = 0.0
    @State var isActive: Bool = false
 
    init(route: AnyView, isChild: Bool, @ViewBuilder label:(()?) -> Content ) {
        self.route = route
        self.isChild = isChild //TODO Remove
        self.label = label(())
        self.isActive = isActive
        self.o = isChild ? 1.0 : 0.0
    
    }
    
    var body: some View {
        let backButtonView =  Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "arrowshape.turn.up.left.circle")
                .foregroundColor(Color.white)
                .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
    
          
        NavigationLink(
                destination: route
                    .opacity(appeared)
                    .animation(Animation.easeIn(duration: 0.05))
                    .onAppear {
                        self.appeared = 1.0
                       // o = isChild ? 1.0: 0.0
                        self.o = isChild ? 1.0 : 0.0
                        
                    }
                    .onChange(of: self.appeared, perform: { _ in
                        self.o = isChild ? 0.0: 1.0
                    })
                    .onDisappear {
                        self.appeared = 0.0
                        self.o = 0.0
                        },
            isActive: $isActive,
            label: {
                label
            }
              )
              .navigationBarBackButtonHidden(true)
              .navigationBarItems(leading:
                                VStack {
                                    backButtonView.opacity(o)
                                }.foregroundColor(.white)
              )
    }
    
    
}


