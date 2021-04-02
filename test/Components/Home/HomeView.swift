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
        VStack {
            ScrollView {
                
               
                DashboardButton(text: "Accounts", action: {
                    NSLog("Accounts")
                }).frame(width: UIScreen.screenWidth)
            
                DashboardButton(text: "TD MySpend", action: {
                    NSLog("TD My Spend")
                }).frame(width: UIScreen.screenWidth)
            
                DashboardButton(text: "TD MySpend", action: {
                    NSLog("2")
                }).frame(width: UIScreen.screenWidth)
            
                DashboardButton(text: "TD MySpend", action: {
                    NSLog("4")
                }).frame(width: UIScreen.screenWidth)
            
                
                TextField("TEXTFIELD", text: $model.textField)
                SecureField("SECUREFIELD", text: $model.secureField)
                TextEditor(text: $model.textEditor)
                Toggle("TOGGLE", isOn:$model.toggleField)
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30.0, height: 30.0, alignment: .leading)
                    .fixedSize(horizontal: true, vertical: true)
                Button("TD Rocks") {
                        //do something
                      pickerOn = true
                    
                }.frame(width: 200.0, height: 30.0, alignment: .center)
                .background(Color.blue)
                .cornerRadius(3.0)
                .popover(isPresented: $pickerOn, content: {
                    showPicker()
                })
    
            }.background(Color.TDLightGray).padding(EdgeInsets(top: CGFloat(-3), leading: CGFloat(0), bottom: CGFloat(0), trailing: CGFloat(0)))
               
        }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .top).background(
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.screenWidth , height: UIScreen.screenHeight,  alignment: .center)
                      .scaledToFit()
        )
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



