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
    func onClick() -> ()
}
struct DashboardButton: View, DashboardButtonProtocol
{
    func onClick() {
        NSLog(self.text)
        // do something
    }
    
    var text: String
    var height: CGFloat

    init(text: String, height: CGFloat, onClick: @escaping () -> ()) {
        self.text = text
        self.height = height
        onClick()
    }
    
    var body: some View {
        let margin = 10
        VStack.init(alignment: .leading, spacing: 0, content: {
            
        
        Button(action:{ onClick() }, label: {
            Text(text)
                .frame(alignment:.leading)
                .foregroundColor(.black)
                .font(.TDStandardFont)
                .background(
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: UIScreen.screenWidth - CGFloat(margin * 2), height: height,  alignment: .topLeading
                        )
                        .cornerRadius(5.0)
                        .padding(EdgeInsets(top: 0, leading: CGFloat(margin), bottom: 0, trailing: CGFloat(margin)))
                        .scaledToFit()
                )
                .opacity(0.8)
                .frame(width: UIScreen.screenWidth, height: height)
            
            
        })
        .background(Color.TDLightGray)
        .frame(width: UIScreen.screenWidth, height: height,  alignment: .leading)
     
        }).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    
    }
}

struct DashboardButtonPreviews: PreviewProvider {
    static var previews: some View {
        DashboardButton(text: "Accounts", height: 88) {
            //something
            return
        }
    }
}
