//
//  GroceryPage.swift
//
//

import SwiftUI

struct GroceryPage: View {
    var body: some View {
        
            ScrollView{
                VStack{
                    Text("Looking").bold().font(.largeTitle)
                    Text("for Groceries?").bold().font(.largeTitle)
                    Image("image1")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .padding(.horizontal, -16)
                    VStack{
                        Image("blinkit").resizable().scaledToFill().frame(width: 100, height: 80)
                            .padding()
                        
                        Text("Delivers in  minutes").bold()
                        
                        HStack{
                            Text("get")
                            Text("FREE delivery").bold()
                            Text("on your first 4 orders")
                        }
                        Button("Install Blinkit now", action: {
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.top, 16)
                    }
                    .padding(24)
                    .overlay{RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(.yellow, lineWidth: 2)
                    }
                    .background(Color("blinkitbg"))
                    HStack{
                        Image(systemName: "star.fill").font(.system(size: 10))
                        Text("ENJOY THESE BENEFITS").tracking(2)
                        Image(systemName: "star.fill").font(.system(size: 10))
                        
                    }.padding()
                    VStack{
                        HStack{
                            Image("list1").resizable().scaledToFill().padding(10).frame(width: 50, height: 50).background(Color.yellow).cornerRadius(50)
                            
                            Text("Enjoy 5000+ products to suit your needs").bold()
                            Spacer()
                        }
                        .padding()
                        .overlay{RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .stroke(.gray, lineWidth: 2)}
                        
                        
                        HStack{
                            Image("list1").resizable().scaledToFill().padding(10).frame(width: 50, height: 50).background(Color.yellow).cornerRadius(50)
                            VStack{
                                HStack {
                                    
                                    Text("Everything delivered").fontWeight(.semibold)
                                    Spacer()
                                }
                                HStack {
                                    
                                    Text("in minutes.").bold()
                                    Spacer()
                                }
                                
                                
                            }
                            Spacer()
                        }
                        .padding()
                        .overlay{RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .stroke(.gray, lineWidth: 1)}
                        
                        HStack{
                            Image("list1").resizable().scaledToFill().padding(10).frame(width: 50, height: 50).background(Color.yellow).cornerRadius(50)
                            
                            Text("Enjoy 5000+ products to suit your needs").bold()
                            Spacer()
                        }
                        .padding()
                        .overlay{RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .stroke(.gray, lineWidth: 1)}
                        
                    }
                    
                }.padding()
            }.padding(.top, 70).foregroundColor(Color("DarkShade")).overlay(HeaderContent(pageTitle: "Grocery"))
            
        }
    }

struct GroceryPage_Previews: PreviewProvider {
    static var previews: some View {
        GroceryPage()
    }
}
