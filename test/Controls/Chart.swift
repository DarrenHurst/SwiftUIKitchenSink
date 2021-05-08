//
//  Chart.swift
//  test
//
//  Created by Darren Hurst on 2021-05-03.
//

import Foundation
import SwiftUI

protocol chartProtocol {
    var data: [CGPoint] { get set }
}

struct ChartView: View {
    let xStepValue: CGFloat
    let yStepValue: CGFloat
    let data: [CGPoint] = [
    .init(x: 1, y: 5),
    .init(x: 2, y: 4),
    .init(x: 3, y: 15),
    .init(x: 4, y: 6),
    .init(x: 5, y: -9),
    .init(x: 6, y: 152),
    .init(x: 7, y: 14),
    .init(x: 8, y: 141),
        .init(x: 9, y: 5),
        .init(x: 10, y: 4),
        .init(x: 11, y: 15),
        .init(x: 12, y: 6),
        .init(x: 13, y: 9),
        .init(x: 14, y: -152),
        .init(x: 15, y: 14),
        .init(x: 16, y: 11)
    ]
    let lineRadius : CGFloat = 0.5
    @Environment(\.colorScheme) var colorScheme
    
    private var maxYValue: CGFloat {
        data.max { $0.y < $1.y }?.y ?? 0
    }
    
    private var maxXValue: CGFloat {
        data.max { $0.x < $1.x }?.x ?? 0
    }
    
    private var xStepsCount: Int {
        Int(self.maxXValue / self.xStepValue)
    }
    
    private var yStepsCount: Int {
        Int(self.maxYValue / self.yStepValue)
    }
    
    var body: some View { VStack { chartBody } }
    
    private var chartBody: some View {
        
            GeometryReader { geometry in
                Path { path in
                    path.move(to: .init(x: 0, y: geometry.size.height))
               
                    var previousPoint = CGPoint(x: 0, y: geometry.size.height)
                    
                    self.data.forEach { point in
                        let x = (point.x / self.maxXValue) * geometry.size.width
                        let y = geometry.size.height - (point.y / self.maxYValue) * geometry.size.height
                        
                     
                        let deltaX = x - previousPoint.x
                        let curveXOffset = deltaX * self.lineRadius
                       
                        path.addCurve(to: .init(x: x, y: y),
                                      control1: .init(x: previousPoint.x + curveXOffset, y: previousPoint.y),
                                      control2: .init(x: x - curveXOffset, y: y ))
                        
                        previousPoint = .init(x: x, y: y)
                    }
                }
                .stroke(
                    Color.green,//LinearGradient.GreenTOWhite,
                    style: StrokeStyle(lineWidth: 4)
                ).saturation(colorScheme == .light ? 0.8:9.0).shadow(color: colorScheme == .light ? .DarkGray: .black, radius: 2, x: 0.0, y: 6.0)
            }.frame(width: UIScreen.screenWidth-50, height: 200, alignment: .center).padding(.leading,23)
    }
}


struct ChartPreview: PreviewProvider {
  
    static var previews: some View {
        ChartView(xStepValue: 1.0, yStepValue: 1.0)
    }
}
