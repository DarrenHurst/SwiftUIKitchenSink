import Foundation
import SwiftUI


protocol OnboardPage2Protocol {
    var theDogs: RealmCombineInteractor {get set}
}
struct OnboardPage2: View, OnboardPage2Protocol {
    var theDogs: RealmCombineInteractor = RealmCombineInteractor.init()
    
    var realmModel: RealmModel
    @Binding var presented: Bool
     var Action: () -> Void
   
   
    var image: Image =  Image(systemName: "arrow.left.circle")
    
    var body: some View {
        ZStack {
            ZStack {
                image.resizable().icon().onTapGesture {
                    self.presented = false
                    Action()
                }.offset(x: -130, y: -240)
            }.standard().frame(alignment: .top)
            VStack {
                Text("This is Realm data").font(.XLarge).offset(y:250)
                List {
                    ForEach ( theDogs.puppies, content: { dog in
                            Text("Puppy Name: \(dog.name)")
                                .onAppear() {
                                print(dog)
                            }
                })
                
                    ForEach ( theDogs.dogs, content: { dog in
                    Button("Dog Name: \(dog.name)",action: {
                        //writeNewDog(name: "Pepper", age: 1)
                    })
                })
                    
                }.offset(y:200)
                
            }.standard()
            
        }
    }
    
   
    
}

 
struct OnboardPage2Preview: PreviewProvider {

    static var previews: some View{
        OnboardPage2(realmModel: RealmModel.init(), presented: .constant(true)){}
    }
}
