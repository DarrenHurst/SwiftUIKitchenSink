
import SwiftUI


struct ButtonItem: Hashable {
    var image: String
    var description_key: String
}

protocol ButtonNavProtocol {
    var items: [ButtonItem] {get set}
}

struct ButtonNav: ButtonNavProtocol, View {
    var items: [ButtonItem]
    
    init(items: [ButtonItem]) {
        self.items = items
    }
        
    var body: some View {
        HStack {
            ForEach(items, id: \.self) { item in
                Button(action:{ NSLog("Add Action")  }, label: {
                 VStack {
                    Image(systemName: item.image)
                        .frame(width: 60.0, height: 60.0, alignment: .center).foregroundColor(.white)
                    .fixedSize(horizontal: true, vertical: true)
                        .background(Circle()
                                        .fill(Color.green)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                        .frame(alignment:.center).padding(4))
                    Text(item.description_key).font(.TDSmall).foregroundColor(.white)
                 }
                })
            }
        }.frame(width: UIScreen.screenWidth, height: 100, alignment: .leading)
        //.padding(EdgeInsets(top: 20, leading: 40, bottom: 20, trailing:20))
    }
}

struct ButtonNavPreview: PreviewProvider {
    static var previews: some View {
        let item: ButtonItem = ButtonItem(image:"mail", description_key: "Contact Us")
        let item2: ButtonItem = ButtonItem(image:"doc.plaintext", description_key: "Settings")
        ButtonNav(items: [item,item2])
    }
}
