//
//  Color.swift
//  test
//
//  Created by Darren Hurst on 2021-04-02.
//

import SwiftUI

extension Color {
    public static var BackgroundColor: Color {
        return Color(UIColor(red: 219/255, green: 175/255, blue: 15/255, alpha: 1.0))
    }
    public static var LightGray: Color {
        return Color(UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0))
    }
    public static var DarkGray: Color {
        return Color(UIColor(red:133/255, green: 133/255, blue: 133/255, alpha: 1.0))
    }
    
    public static var label: Color {
        return Color(UIColor.label)
    }
    
}

extension LinearGradient {
    public static var GreenTOBlack: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [.green, .green, .white]), startPoint: .top, endPoint: .bottom)
    }
    public static var GreenTOWhite: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [.DarkGray, .green,.DarkGray,.green]), startPoint: .top, endPoint: .bottom)
    }
}
extension RadialGradient {
    public static var  fun: RadialGradient {
        return RadialGradient(gradient: Gradient(colors: [.yellow,.orange, .white]), center: .center, startRadius: 57, endRadius: 5500)
    }}
