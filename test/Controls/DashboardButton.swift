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
      
        Button( action: onAction, label: {
            Text(text)
                .frame(maxWidth: UIScreen.screenWidth, alignment: .leading)
                .cornerRadius(5.0)
                .offset(x:25)
                .foregroundColor(Color.black)
                .scaledToFill()
                .font(.subheadline)
                .background(
                    Rectangle()
                        .fill(Color.gray)
                        .cornerRadius(5.0)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .frame(maxWidth: UIScreen.screenWidth, maxHeight: 88.0, alignment: .leading)
                        .scaledToFill()
                ).opacity(0.8)
            
        }).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .scaledToFill()
        
    
    }
}

struct DashboardButtonPreviews: PreviewProvider {
    static var previews: some View {
        DashboardButton(text: "Accounts", action: {})
    }
}
