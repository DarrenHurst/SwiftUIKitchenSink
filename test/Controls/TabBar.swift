//
//  TabBar.swift
//  test
//
//  Created by Darren Hurst on 2021-04-07.
//
import Foundation
import SwiftUI

struct TDtabBar: View {
    @State var index: Int = 0
    @State var curvePos: CGFloat = 0
    
    @State var menu1: Bool = false
    @State var menu2: Bool = false
    @State var menu3: Bool = false
    @State var menu4: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {

        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            Color("Color")
        
            HStack {
            
                GeometryReader(content: { g in
            
                    VStack {
                
                        Button(action: {
                            
                        withAnimation(.interactiveSpring()){
                        index = 0
                            self.curvePos = g.frame(in: .global).midX
                            self.menu1 = true
                        }
                }, label: {
               
                    Image(systemName: "bookmark.circle.fill")
                        .renderingMode(.template)
                .resizable()
                .foregroundColor(index == 0 ? .black : .gray)
                .frame(width:32, height:32)
                        .padding(.all, 15)
                        .background(Color.white.opacity(index == 0 ? 1 : 0)).clipShape(Circle())
                        .offset(y: index == 0 ? -15 :0)
                        
                })
                    }.frame(width: 43, height: 43)
                    .popover(isPresented: $menu1) {
                                         Text("navigation list")
                                             .font(.headline)
                                             .padding()
                                     }
                    .onAppear {
                        DispatchQueue.main.async {
                            self.curvePos = g.frame(in: .global).midX
                        }
                    }
                   
                
            }).frame(width: 43, height: 43)
              
                
                Spacer(minLength: 0)
                
                    GeometryReader(content: { g in
                
                        VStack {
                    
                            Button(action: {
                        withAnimation(.interactiveSpring()){
                            index = 1
                            self.curvePos = g.frame(in: .global).midX
                            self.menu2 = true
                        }
                    }, label: {
                   
                        Image(systemName: "calendar.circle.fill")
                            .renderingMode(.template)
                    .resizable()
                    .foregroundColor(index == 1 ? .black : .gray)
                    .frame(width:32, height:32)
                            .padding(.all, 15)
                            .background(Color.white.opacity(index == 1 ? 1 : 0)).clipShape(Circle())
                            .offset(y: index == 1 ? -15 :0)
                            
                    })
                        }.frame(width: 43, height: 43)
                        .popover(isPresented: $menu2) {
                                             Text("navigation list")
                                                 .font(.headline)
                                                 .padding()
                                         }
                        .onAppear {
                            DispatchQueue.main.async {
                                self.curvePos = g.frame(in: .global).midX
                            }
                        }
                
                }).frame(width: 43, height: 43)
                    
                    Spacer(minLength: 0)
                
                    GeometryReader(content: { g in
                
                        VStack {
                            //Router(route: AnyView(ContentView()), isChild: false, label:{_ in
                            Button(action: {
                        withAnimation(.interactiveSpring()){
                            self.index = 2
                            self.curvePos = g.frame(in: .global).midX
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }, label: {
                        
                        Image("Logo")
                          .resizable()
                            .background(Color.blue)
                            .foregroundColor(index == 2 ? .black : .gray)
                            .frame(width: 48, height: 48, alignment: .center).fixedSize().fixedSize(horizontal: true, vertical: true).mask(Circle())
                    //})
                    //.foregroundColor(index == 0 ? .black : .white)
                    .frame(width:48, height:48)
                            .padding(.all, 15)
                            .background(Color.white.opacity(index == 2 ? 1 : 0)).clipShape(Circle())
                            .offset(y: index == 2 ? -15 :0)
                                               })
                        }.frame(width: 43, height: 43)
                        .onAppear {
                            DispatchQueue.main.async {
                                self.curvePos = g.frame(in: .global).midX
                            }
                        }

                
                }).frame(width: 43, height: 43)
                
                    Spacer(minLength: 0)
                
                    GeometryReader(content: { g in
                
                        VStack {
                    
                            Button(action: {
                        withAnimation(.interactiveSpring()){
                            index = 3
                            self.curvePos = g.frame(in: .global).midX
                            self.menu3 = true
                        }
                    }, label: {
                   
                        Image(systemName: "paperclip.circle.fill")
                            .renderingMode(.template)
                    .resizable()
                    .foregroundColor(index == 3 ? .black : .gray)
                    .frame(width:32, height:32)
                            .padding(.all, 15)
                            .background(Color.white.opacity(index == 3 ? 1 : 0)).clipShape(Circle())
                            .offset(y: index == 3 ? -15 :0)
                           
                    }).popover(isPresented: $menu3, attachmentAnchor: .point(UnitPoint.bottom), arrowEdge: .top, content: {
                        VStack {
                        ListSample().onDisappear(perform: {
                            index = 8
                        })
                        }.frame(height:100, alignment: .top)
                    })
                        }.frame(width: 43, height: 43)
                        
                            
                        
                        .onAppear {
                            DispatchQueue.main.async {
                                self.curvePos = g.frame(in: .global).midX
                            }
                        }
                
                }).frame(width: 43, height: 43)
                    
                    Spacer(minLength: 0)
                
                    GeometryReader(content: { g in
                
                        VStack {
                    
                            Button(action: {
                                withAnimation(.interactiveSpring()){
                            index = 4
                            self.curvePos = g.frame(in: .global).midX
                                    self.menu4 = true
                        }
                    }, label: {
                   
                        Image(systemName: "link.circle.fill")
                            .renderingMode(.template)
                    .resizable()
                    .foregroundColor(index == 4 ? .black : .gray)
                            .background(Color.white).mask(Circle())
                    .frame(width:32, height:32)
                            .padding(.all, 15)
                            .background(Color.white.opacity(index == 4 ? 1 : 0)).clipShape(Circle())
                            .offset(y: index == 4 ? -15 :0)
                            
                    })
                        }.frame(width: 43, height: 43)
                        .popover(isPresented: $menu4) {
                                             Text("navigation list")
                                                 .font(.headline)
                                                 .padding()
                                         }
                        .onAppear {
                            DispatchQueue.main.async {
                                self.curvePos = g.frame(in: .global).midX
                            }
                        }
                
                }).frame(width: 43, height: 43)
                 
            } // hstack
            .background(Color.white.clipShape(CShape(curvePos: $curvePos)))
        
            .padding(.bottom, 30)
            .padding(.top, 10)
            .frame(width:UIScreen.screenWidth, height:44)
                
        }).edgesIgnoringSafeArea(.all)
        .background(Color.white)
        .frame(width: UIScreen.screenWidth)
        
    }
}


struct CShape: Shape {
    @Binding var curvePos: CGFloat
    func path(in rect: CGRect) -> Path {
        return Path { path in
       /*                     path.move(to: CGPoint(x: 0, y:0))
                           path.addLine(to: CGPoint(x: 0, y: rect.height))
                           path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
  
        
            path.move(to:CGPoint(x:curvePos + 30, y:0))
                      
            path.addQuadCurve(to: CGPoint(x: curvePos - 30, y: 0), control: CGPoint(x:curvePos, y: 70))
        */
        }
    }
}


struct TDTabBarPreview: PreviewProvider {

static var previews: some View {
    TDtabBar(curvePos: 10)
}
}
