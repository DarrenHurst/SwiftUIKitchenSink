//
//  FlatMenuBar.swift
//  test
//
//  Created by Darren Hurst on 2021-04-11.
//

import Foundation
import SwiftUI

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
            }).standardButton()
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
