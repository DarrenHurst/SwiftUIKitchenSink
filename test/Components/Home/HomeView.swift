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


protocol HeaderProtocol: View {
    var infoClicked: Bool {get set}
}

struct HeaderView: View, HeaderProtocol {
    @State var infoClicked: Bool = false
    
    init(click: Bool) {
        self.infoClicked = click
    }
    
    var body: some View {
    
    let columns = [
   GridItem(.flexible(minimum:30)),
   GridItem(.flexible(minimum:30)),
   GridItem(.flexible(minimum:30))
  ]
    VStack {
        NavigationLink(destination: SettingsView(), isActive:$infoClicked, label:{})
     
    LazyVGrid(columns: columns, content: {
      
                Button(action:{ infoClicked = true  },
                       label: {
            Image(systemName: "text.justify")
        })
    .foregroundColor(Color.white)
    .frame(width: 50, height: 50, alignment: .leading)
 
    
    Image("Logo")
      .resizable()
        .frame(width: 33, height: 35, alignment: .center).fixedSize().fixedSize(horizontal: true, vertical: true)
 
      
    Button(action: {
            
            self.infoClicked = true
    
                }) {
                Image(systemName: "info")
                    .foregroundColor(.white).frame(width: 50.0, height: 50.0, alignment: .center)
    }
        
    }).frame(height:70)
    }.frame(height: 100, alignment: .center)
        
    
    }
}
struct HomeView: View {
    
    @ObservedObject private var model = testModel.shared
    
    @State var pickerOn: Bool = false
    @State var infoClicked: Bool = false
    
    let item: ButtonItem = ButtonItem(image:"mail", description_key: "Accounts")
    let item2: ButtonItem = ButtonItem(image:"doc.plaintext", description_key: "Transfers")
    let item3: ButtonItem = ButtonItem(image:"slider.horizontal.3", description_key: "Pay Bills")
    
    var body: some View {
    
        
        NavigationView {
            VStack {
                HeaderView(click: infoClicked).frame(height:88).offset(y:15)
                    ButtonNav(items: [item,item2,item3])
                        .frame(height:80,alignment:.top).padding(EdgeInsets(top: 10, leading: 25, bottom: 0, trailing: 0)).offset(y:-20)
                
                                   
            ScrollView {
                DashboardButton(text: "Accounts", height: 65, onClick: {}).padding(2)
                       
                DashboardButton(text: "TD MySpend", height: 65, onClick: {}).padding(2)
                    .frame(width: UIScreen.screenWidth) .background(Color.TDLightGray)
            }.frame(height:UIScreen.screenHeight - 175).background(Color.TDLightGray)
            }
            .background( LinearGradient(gradient: Gradient(colors: [.green, .black]), startPoint: .top, endPoint: .bottom))
            .navigationBarHidden(true)
        }
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


