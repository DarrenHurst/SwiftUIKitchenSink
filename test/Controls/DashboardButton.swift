//
//  DashboardButton.swift
//  test
//
//  Created by Darren Hurst on 2021-04-01.
//
import SwiftUI
import Combine

protocol DashboardButtonProtocol {
 
    var text: String { get set }
    var height: CGFloat { get set }
    func onClick() -> Void
}


struct DashboardButton: View, DashboardButtonProtocol
{
    
    var text: String
    var height: CGFloat
    func onClick() {}
    
    @State var index: Int = 0
    @State var showAccount: Bool = false
    
    var body: some View {
        let margin = 10
       
        
        
        VStack.init(alignment: .leading, spacing: 0, content: {
            
            HStack {
                Button(action:{ self.showAccount =  true
                    let ticket:firstClass = firstClass()
                    NSLog("The number of rooms is \(ticket.firstClass!.food)")
                }, label: {
            Text(text)
                .frame(width:UIScreen.screenWidth, alignment:.leading)
                .padding(.leading, 60)
                .foregroundColor(.black)
                .font(.StandardFont)
                .background(
                    
                    NavigationLink(
                        destination: Accounts(),
                        label: {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: UIScreen.screenWidth - CGFloat(margin * 2), height: height,  alignment: .topLeading
                                )
                                .cornerRadius(5.0)
                                .padding(EdgeInsets(top: 0, leading: CGFloat(margin), bottom: 0, trailing: CGFloat(margin)))
                                .scaledToFit()
                        })
                )
                .opacity(0.8)
                .frame(width: UIScreen.screenWidth, height: height)
            
            
        })
        .background(Color.LightGray)
        .frame(width: UIScreen.screenWidth, height: height,  alignment: .leading)
            }.frame(alignment:.leading)
            
        }).padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
    
    }
}

struct DashboardButtonPreviews: PreviewProvider {
    static var previews: some View {
        DashboardButton(text: "Accounts", height: 88, index: 0)
    }
}
