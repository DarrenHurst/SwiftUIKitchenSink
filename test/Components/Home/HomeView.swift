//
//  HomeView.swift
//  test
//
//  Created by Darren Hurst on 2021-03-23.
//

import SwiftUI
import Combine

class testModel: ObservableObject {
    @Published var textField: String = ""
    @Published var secureField: String = ""
    @Published var textEditor: String = ""
    @Published var toggleField: Bool = false
    
    
    static let shared = testModel()
    init() {

    }
    
}
enum pickerSelection: String, CaseIterable, Identifiable {
    case YES
    case NO

var id: String { self.rawValue }
}




struct HomeView: View {
    
    @ObservedObject private var model = testModel.shared
    
    @State var pickerOn: Bool = false
    @State var infoClicked = false
    
    var body: some View {
        VStack.init(alignment:.center, spacing: nil, content: {
            HeaderView(infoClicked: infoClicked).frame(width: UIScreen.screenWidth, height: 50, alignment: .top)
            ScrollView {
                
                VStack {
                        
                            let item: ButtonItem = ButtonItem(image:"mail", description_key: "Accounts")
                            let item2: ButtonItem = ButtonItem(image:"doc.plaintext", description_key: "Transfers")
                            let item3: ButtonItem = ButtonItem(image:"slider.horizontal.3", description_key: "Pay Bills")
                    ButtonNav(items: [item,item2,item3]).frame(width: UIScreen.screenWidth, height: 80, alignment: .top).offset(y:-34).background(Color.green)
                }.background(Color.green)
                .frame(height:90, alignment: .top)
            
            
            
            
            VStack(alignment: .leading, spacing: nil, content: {
                DashboardButton(text: "Accounts", height: 65, onClick: {}).frame(width: UIScreen.screenWidth) .background(Color.TDLightGray)
            
                DashboardButton(text: "TD MySpend", height: 65, onClick: {})
                    .frame(width: UIScreen.screenWidth) .background(Color.TDLightGray)
            }).frame(height:UIScreen.screenHeight, alignment:.top)
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            .background(Color.TDLightGray).offset(y:-25)
                
            }.frame(height:UIScreen.screenHeight-150,alignment: .top).offset(y:-20)
        }).ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

func LogAction(text: String){
    NSLog(text)
}
struct showPicker : View {
    @ObservedObject private var model = testModel.shared
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedValue: pickerSelection = pickerSelection.YES
    
    var body: some View {
        
        VStack.init(alignment: .leading, spacing: 1.0, content: {
            Button("Close", action: {
                presentationMode.wrappedValue.dismiss()
            })
            Spacer()
            Divider()
            Spacer()
            Picker(selection: $selectedValue, label: Text("Does it?"), content: {
                Text("YES")
                Text("NO")
            })
        }).frame(width: UIScreen.screenWidth, height: 80.0, alignment: .bottom)
    }
}


struct HomeView_Previews: PreviewProvider {
static var previews: some View {
    HomeView()
}
}


struct HeaderView: View {
    @State var infoClicked:Bool = false
    
    init(infoClicked: Bool){}
  
    var body: some View {
        
        
        
        let columns = [
       GridItem(.flexible(minimum:30)),
       GridItem(.flexible(minimum:30)),
       GridItem(.flexible(minimum:30))
      ]
        NavigationLink(destination: SettingsView().navigationTitle(""), isActive: $infoClicked ) { }
        LazyVGrid(columns: columns, content: {
          
                    Button(action:{ self.infoClicked = true  },
                           label: {
                Image(systemName: "text.justify")
            })
        .foregroundColor(Color.white)
        .frame(width: 50, height: 50, alignment: .leading)
     
        
        Image("Logo")
          .resizable()
            .frame(width: 33, height: 35, alignment: .center).fixedSize().fixedSize(horizontal: true, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
     
          
        Button(action: {
                self.infoClicked = true
                    }) {
                    Image(systemName: "info")
                        .foregroundColor(.white).frame(width: 50.0, height: 50.0, alignment: .center)
        }
        
            
        }).background(Color.green)
        .frame(minHeight:50)
    }
}

