//
//  ViewModifier.swift
//  test
//
//  Created by Darren Hurst on 2021-04-18.
//

import Foundation
import SwiftUI

// Standard View   VStack, HStack
struct Standard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight).background(Color.clear)
            
    }
}

struct Icon: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 70, height: 70).background(Color.clear).foregroundColor(.black)
    }
}

extension View {
    func standard() -> some View {
       modifier(Standard())
    }
    
    func icon() -> some View {
        modifier(Icon())
    }
}


struct StandardButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .frame(height: 44, alignment: .center)
            .background(Color.white)
    }
}

extension Button {
    func standardButton() -> some View {
        modifier(StandardButton())
    }
}

struct OffStyle: ViewModifier {
    func body(content: Content) -> some View {
            content
                .font(.caption)
                .padding(10)
                .foregroundColor(Color.white)
                .background(Color.blue)
                //.border(Color.black, width: 4)
                .font(.Large)
                .scaledToFill()
        }
}

struct OnStyle: ViewModifier {
    func body(content: Content) -> some View {
            content
                .font(.caption)
                .padding(10)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .font(.Large)
                .scaledToFit()
        }
}

extension Button {
    func offStyle() -> some View {
        modifier(OffStyle())
    }
    func onStyle() -> some View {
        modifier(OnStyle())
    }
}
