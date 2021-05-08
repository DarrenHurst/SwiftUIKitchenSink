import Foundation
import SwiftUI

struct OnboardPage2: View {
    @Binding var presented: Bool
    var Action: () -> Void
    var image: Image =  Image(systemName: "arrow.left.circle")
    var body: some View {
        ZStack {
            VStack {
                image.resizable().icon().onTapGesture {
                    self.presented = false;
                    Action()
                }
            }.standard()
        }
    }
}

struct OnboardPage2Preview: PreviewProvider {
    static var previews: some View{
        OnboardPage2(presented: .constant(true)){}
    }
}
