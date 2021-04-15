//
//  FlatMenuBar.swift
//  test
//
//  Created by Darren Hurst on 2021-04-11.
//

import Foundation
import SwiftUI

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

struct FlatMenuBar: View {
    var action1:() ->Void?
    var action2:() ->Void?
    var action3:() ->Void?
    
    var body: some View {
        let columns = [
            GridItem(.flexible(minimum:30)),
            GridItem(.flexible(minimum:30)),
            GridItem(.flexible(minimum:30))
        ]
    
        LazyVGrid(columns: columns, content: {
            Button("Summary", action: {
                action1()
            }).onStyle()
            Button("Rewards", action: {
                action2()
            }).offStyle()
            Button("Manage", action: {
                action3()
            }).offStyle()
        }).background(Color.blue)

    }

}

struct FlatMenuBarPreview: PreviewProvider {

static var previews: some View {
    FlatMenuBar(action1: {
        NSLog("click")
    }, action2: {}, action3: {})
}
}
