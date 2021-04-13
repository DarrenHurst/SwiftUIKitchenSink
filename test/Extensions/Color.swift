//
//  Color.swift
//  test
//
//  Created by Darren Hurst on 2021-04-02.
//

import SwiftUI

extension Color {
    public static var TDBackgroundColor: Color {
        return Color(UIColor(red: 219/255, green: 175/255, blue: 15/255, alpha: 1.0))
    }
    public static var TDLightGray: Color {
        return Color(UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0))
    }
    public static var TDDarkGray: Color {
        return Color(UIColor(red: 219/255, green: 175/255, blue: 15/255, alpha: 1.0))
    }
    public static var DarkGrey: Color {
       return Color(red: 32/255, green: 32/255, blue: 32/255)
    }
    public static var label: Color {
        return Color(UIColor.label)
    }
    
}

extension LinearGradient {
    public static var TDGreenTOBlack: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [.green, .green, .white]), startPoint: .top, endPoint: .bottom)
    }
    public static var TDGreenTOWhite: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [.green, .green,.green,.green, .white]), startPoint: .top, endPoint: .bottom)
    }
}
