//
//  Font.swift
//  test
//
//  Created by Darren Hurst on 2021-04-02.
//

import SwiftUI

extension Font {
    
    public static var TDLargeBoldFont: Font {
        return Font.custom("HelveticaNeue", size: 20).bold()
    }
    
    public static var TDSmall: Font {
        return Font.custom("HelveticaNeue", size: 12)
    }
    public static var TDMedium: Font {
        return Font.custom("HelveticaNeue", size: 18)
    }
    public static var TDLarge: Font {
        return Font.custom("HelveticaNeue", size: 22)
    }
    public static var TDStandardFont: Font {
        return Font.custom("HelveticaNeue", size: 12)
    }
    
    public static var TDTickerFont: Font {
        return Font.custom("HelveticaNeue-italic", size: 15)
    }
    
}
