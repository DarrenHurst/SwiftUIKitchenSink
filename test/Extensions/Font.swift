//
//  Font.swift
//  test
//
//  Created by Darren Hurst on 2021-04-02.
//

import SwiftUI

extension Font {
    
    public static var LargeBoldFont: Font {
        return Font.custom("HelveticaNeue", size: 20).bold()
    }
    
    public static var Small: Font {
        return Font.custom("HelveticaNeue", size: 12)
    }
    public static var Medium: Font {
        return Font.custom("HelveticaNeue", size: 18)
    }
    public static var Large: Font {
        return Font.custom("HelveticaNeue", size: 22)
    }
    public static var StandardFont: Font {
        return Font.custom("HelveticaNeue", size: 12)
    }
    
    public static var TickerFont: Font {
        return Font.custom("HelveticaNeue-italic", size: 11)
    }
    
}
