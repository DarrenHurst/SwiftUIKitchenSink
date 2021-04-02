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
    func onAction() -> Void
}
struct DashboardButton: View, DashboardButtonProtocol
{
    var text: String
    
    func onAction() {}

    init(text: String, action: @escaping () -> Void) {
        self.text = text
    }
    
    var body: some View {
        let margin = 15
        let offset_padding = margin * 4
        Button(action: onAction, label: {
            Text(text)
                .offset(x: -(UIScreen.screenWidth / 2) + CGFloat(offset_padding))
                .foregroundColor(.black)
                .font(.TDStandardFont)
                .frame(minHeight: 80, alignment:.leading)
                .background(
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: UIScreen.screenWidth - CGFloat(margin * 2), height: 100,  alignment: .center)
                        .cornerRadius(5.0)
                        .padding(EdgeInsets(top: CGFloat(margin), leading: CGFloat(margin), bottom: CGFloat(margin), trailing: CGFloat(margin)))
                        .scaledToFit()
                )
                .opacity(0.8)
                .padding(EdgeInsets(top: CGFloat(margin), leading: CGFloat(margin), bottom: CGFloat(margin), trailing: CGFloat(margin)))
                .frame(maxWidth: UIScreen.screenWidth)
            
            
        }).frame(maxWidth: UIScreen.screenWidth, alignment: .leading)
     
        
    
    }
}

struct DashboardButtonPreviews: PreviewProvider {
    static var previews: some View {
        DashboardButton(text: "Accounts", action: {})
    }
}
