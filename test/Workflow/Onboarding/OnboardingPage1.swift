//
//  File.swift
//  test
//
//  Created by Darren Hurst on 2021-05-07.
//

import Foundation
import SwiftUI

struct OnboardPage1: View {
    @Binding var presented: Bool
    var Action: () -> Void
    
    @State var layer1 : Bool = false
    @State var layer2 : Bool = false
    @State var layer3 : Bool = false
    var sceneDelay : Double = 0.5
    
    
    var image: Image =  Image(systemName: "arrow.right.circle")
    var body: some View {
        ZStack {
            VStack {
                image.resizable().icon().onTapGesture {
                    self.presented = false;
                    Action()
                }.offset(x: 100, y: -250)
                .animation( stopAnimation() )
                
                Text("What is a Kitchen Sink").offset(CGSize(width: -0.0, height: -40.0))
                   
                    .animation(layer3 ? runAnimation().delay(sceneDelay*3) : stopAnimation() )
               
            }.standard()
            
            
            Circle().frame(width: 20, height: 20, alignment: .center).offset(x:-120, y:100)       .foregroundColor(Color.blue).opacity(0.2).opacity(layer1 ? 0.0 : 0.8)
                .animation(layer1 ? runAnimation().delay(sceneDelay  * 2 ) : stopAnimation() )
            
            Circle().frame(width: 25, height: 25, alignment: .center).offset(x:-105, y:80)       .foregroundColor(Color.blue).opacity(0.4).opacity(layer2 ? 0.0 : 0.8 )
                .animation(layer2 ? runAnimation().delay(sceneDelay  * 2 ) : stopAnimation() )
            
            Circle().frame(width: 200, height: 300, alignment: .center)
                .foregroundColor(Color.blue).opacity(0.6)
                .cornerRadius(3.0)
                .scaleEffect(CGSize(width: 1.0, height: 0.5))
                .offset(x: 0, y: -0).opacity( 1.0 )
                .animation( stopAnimation() )
            
            Circle().frame(width: 30, height: 30, alignment: .center).offset(x:-80, y:60)       .foregroundColor(Color.blue).opacity(layer3 ? 0.0: 0.8)
                .animation(layer3 ? runAnimation().delay(sceneDelay ) : stopAnimation() )
           
          
        }
        .onAppear(){
            self.layer1 = true
         
            self.layer2 = true
   
            self.layer3 = true
        }
    }
}

struct OnboardPage1Preview: PreviewProvider {
    static var previews: some View{
        OnboardPage1(presented: .constant(true)){}
    }
}
