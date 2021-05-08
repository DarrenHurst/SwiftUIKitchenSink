//
//  Map.swift
//  test
//
//  Created by Darren Hurst on 2021-05-03.
//

import Foundation
import MapKit
import SwiftUI

struct MapView : View {
    @State var mapRect: MKMapRect = MKMapRect.init()
    var body: some View {
        VStack {
            
            Map(mapRect: $mapRect).frame(height:UIScreen.screenHeight-200)
    
             
        }
    }
}

struct MapViewPreview: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
