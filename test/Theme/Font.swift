//
//  Font.swift
//  test
//
//  Created by Darren Hurst on 2021-04-02.
//

import SwiftUI

extension Font {
    
    static func loadFonts() {
            // Register fonts to app, without using the Info.plist.... :smiling_imp:
            if let fontURLs = Bundle.main.urls(forResourcesWithExtension: "ttf", subdirectory: "cookie") {
                if #available(iOS 13.0, *) {
                    CTFontManagerRegisterFontURLs(fontURLs as CFArray, .process, true, nil)
                } else {
                    CTFontManagerRegisterFontsForURLs(fontURLs as CFArray, .process, nil)
                }
            }
        }
    
    
    public static var LargeBoldFont: Font {
        loadFonts()
        return Font.custom("Cookie-Regular", size: 20).bold()
    }
    
    public static var Small: Font {
    
        return Font.custom("Helvetica-Neue", size: 12)
    }
    public static var Medium: Font {
     
        return Font.custom("Helvetica-Neue", size: 14)
    }
    public static var Large: Font {
        loadFonts()
        return Font.custom("Cookie-Regular", size: 28)
    }
    public static var XLarge: Font {
        loadFonts()
        return Font.custom("Cookie-Regular", size:42)
    }
    public static var StandardFont: Font {
        return Font.custom("Helvetica-Neue", size: 12)
    }
    
    public static var TickerFont: Font {
        return Font.custom("HelveticaNeue-italic", size: 12)
    }
    
}
