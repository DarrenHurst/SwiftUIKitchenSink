//
//  TabBar.swift
//  test
//
//  Created by Darren Hurst on 2021-04-07.
//
import Foundation
import SwiftUI
import Lottie

struct TDtabBar: View {
    @State var index: Int = 8
    @State var curvePos: CGFloat = 0
    
    @State var menu1: Bool = true
    @State var menu2: Bool = false
    @State var menu3: Bool = false
    @State var menu4: Bool = false
    @State var run: Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func resetMenu() -> Void {
        menu1 = false
        menu2 = false
        menu3 = false
        menu4 = false
        run = false
    }
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            PageView(presented: $menu1, backgroundColor: Color.orange, page:  AnyView(ChartView(xStepValue: 1.0, yStepValue: 0.04)
                                                        .frame(width: 100, height: UIScreen.screenHeight-300, alignment: .top)
                                                                                        .offset(x:-10,y:-45)), Action: {
                                              })
            PageView(presented: $run, backgroundColor: Color.red, page:  AnyView(OnboardingWorkflow().frame(width: 100, height: UIScreen.screenHeight, alignment: .bottom)
            ), Action: {
            })
           
            
            
            ZStack {
                VStack{
                    Page.init(isPresented: self.$menu2,backgroundColor: Color.red, view: AnyView(ListSample().frame(width: 100, height: UIScreen.screenHeight, alignment: .top).offset(y:-195)))
                }.opacity(self.menu2 ? 1.0: 0.0)
            }.opacity(self.menu2 ? 1.0: 0.0)
           // .background(self.menu2 ? Color.red: Color.white)
            
            
            ZStack {
                VStack{
                    Page.init(isPresented: self.$menu3,backgroundColor: Color.blue, view: AnyView(PhoneScreen().frame(width: 100, height: UIScreen.screenHeight, alignment: .top).offset(x:-20)))
                }.opacity(self.menu3 ? 1.0: 0.0)
            }.opacity(self.menu3 ? 1.0: 0.0)
            
            ZStack {
                VStack{
                    Page.init(isPresented: self.$menu4,backgroundColor: Color.green, view: AnyView(ListSample().frame(width: 100, height: UIScreen.screenHeight, alignment: .top).offset(y:-200).hueRotation(Angle(degrees: 90)))).frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .bottom)
                }.opacity(self.menu4 ? 1.0: 0.0)
            }.opacity(self.menu4 ? 1.0: 0.0)
            HStack {
            
                GeometryReader(content: { g in
            
                    VStack {
                
                        Button(action: {
                            
                        withAnimation(.interactiveSpring()){
                        index = 0
                            self.curvePos = g.frame(in: .global).midX
                            self.resetMenu()
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
                            DispatchQueue.main.async {
                                self.resetMenu()
                                self.index = 1
                                self.menu2 = true
                            }
                           
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
                        /*.popover(isPresented: $menu2) {
                                             Text("navigation list")
                                                 .font(.headline)
                                                 .padding()
                                         }
                       */ .onAppear {
                            DispatchQueue.main.async {
                                self.curvePos = g.frame(in: .global).midX
                            }
                        }
                  
                       
                
                }).frame(width: 43, height: 43)
                    
                    Spacer(minLength: 0)
                
                    GeometryReader(content: { g in
                
                        VStack {
                  
                            
                            IconWithBounce(run: self.$run){
                                DispatchQueue.main.async {
                                    self.resetMenu()
                                    self.index = 2
                                    self.run = true
                                }
                            }.offset(x:-20,y:-50)
                     
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
                       
                            DispatchQueue.main.async {
                                self.resetMenu()
                                self.index = 3
                                self.menu3 = true
                            }
                    
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
                                    resetMenu()
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
    TDtabBar()
}
}
