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
        VStack.init() {
            List {
                Text("TEXT")
                TextField("TEXTFIELD", text: $model.textField)
                SecureField("SECUREFIELD", text: $model.secureField)
                TextEditor(text: $model.textEditor)
                Toggle("TOGGLE", isOn:$model.toggleField)
                Image("TDLogo")
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
    
            }
               
        }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .top) .background(Color.black)
    }
}

struct showPicker : View {
    @ObservedObject private var model = testModel.shared
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedValue: pickerSelection = pickerSelection.YES
    
    var body: some View {
        
        VStack.init(alignment: .leading, spacing: 1.0, content: {
            Button("X", action: {
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
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct SettingsView: View {
    var body: some View {
        Text("Settings")
        .navigationBarTitle("Settings",
                            displayMode: .automatic)
    }
}

// MainView Tab bar
    struct MainView: View {
        var body: some View {
            TabView{
                HomeView().tabItem {
            Image(systemName: "heart.fill")
            Text("Home").navigationBarHidden(true).navigationBarBackButtonHidden(true)
        }
               SettingsView().tabItem {
                    Image(systemName: "doc.richtext")
                    Text("Settings").navigationBarHidden(true).navigationBarBackButtonHidden(true)
                }
               
            }
            
        }
    }
