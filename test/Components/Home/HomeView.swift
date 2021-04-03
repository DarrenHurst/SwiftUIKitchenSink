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
    
    var body: some View {
       
        
        ScrollView {
            LazyVStack {
            Rectangle().fill(Color.green).frame(width: UIScreen.screenWidth, height: 140, alignment: .top).offset(y:-20)
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 30.0, height: 30.0, alignment: .leading)
                .offset(y:-130)
                .fixedSize(horizontal: true, vertical: true)
                
                let item: ButtonItem = ButtonItem(image:"mail", description_key: "Contact Us")
                let item2: ButtonItem = ButtonItem(image:"doc.plaintext", description_key: "Settings")
                ButtonNav(items: [item,item2]).offset(y:-175)
                
            }.frame( alignment: .top)
            
            LazyVStack {
            
            DashboardButton(text: "Accounts", height: 55, onClick: {}).frame(width: UIScreen.screenWidth)
        
            DashboardButton(text: "TD MySpend", height: 55, onClick: {}).frame(width: UIScreen.screenWidth)
        
            TextField("TEXTFIELD", text: $model.textField)
            SecureField("SECUREFIELD", text: $model.secureField)
            TextEditor(text: $model.textEditor)
            Toggle("TOGGLE", isOn:$model.toggleField)
            }.offset(y:-189)

        }.background(Color.TDLightGray)
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



