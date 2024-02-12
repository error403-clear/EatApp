//
//  FilterView.swift


import SwiftUI

struct FilterView: View {
    @State private var showFilter: Bool = false
    @State private var switchOn: Bool = false
    @Binding  var minPrice: String
    @Binding  var maxPrice: String
    @State private var filterDialogueValue = 0
    @State private var selectCategory = [false, false, false, false,false,false,false,false,false,false,false,false]
    @Binding var vegSelected: Bool
    var filterAction: (()->())
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                Text("Filter").font(.title.weight(.medium))
                Spacer()
            }
            .padding()
            Divider().frame(height: 8)
            HStack{
                Text("Veg Only").font(.title2.weight(.medium))
                Spacer()
                Toggle(isOn: $switchOn ) {
                }
            }
            VStack(alignment: .leading){
                Text("Price").font(.title2.weight(.medium))
                HStack{
                    VStack{
                        Text("Min")
                        TextField("min", text: $minPrice)
                            .keyboardType(.numberPad)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.black),lineWidth: 1))
                            .padding(.leading).cornerRadius(10).padding()
                       
                    }
                    VStack{
                        Text("Max")
                        TextField("max", text: $maxPrice)
                            .keyboardType(.numberPad)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.black),lineWidth: 1)).padding(.trailing).cornerRadius(10).padding()
                        
                    }
                }
            }
            VStack{
                HStack{
                    Text("Category").font(.title2.weight(.medium))
                }
                HStack{
                    Text("Indian").padding()
                        .foregroundColor(selectCategory[0] ? Color.blue : Color.red)
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(selectCategory[0] ? Color.blue :  Color.black,lineWidth: 1))
                        .onTapGesture{
                            selectCategory[0].toggle()
                         }
                    Text("south indian").padding().foregroundColor(selectCategory[1] ? Color.blue : Color.red).lineLimit(1)
                  
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(selectCategory[1] ? Color.blue : Color.black,lineWidth: 1))
                        .onTapGesture{
                            selectCategory[1].toggle()
                            
                        }
                    Text("korean").padding().lineLimit(1)
                        .foregroundColor(selectCategory[2] ? Color.blue : Color.red)
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(selectCategory[2] ? Color.blue : Color.black,lineWidth: 1))
                        .onTapGesture{
                            selectCategory[2].toggle()
                        }
                }
                HStack
                {
                    
                    Text("italian").padding()
                        .foregroundColor(selectCategory[3] ? Color.blue : Color.red)
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(selectCategory[3] ? Color.blue : Color.black,lineWidth: 1))
                        .onTapGesture{
                            selectCategory[3].toggle()
                    
                        }
                    Text("french").padding().foregroundColor(selectCategory[4] ? Color.blue : Color.red).lineLimit(1)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(selectCategory[4] ? Color.blue : Color(.black),lineWidth: 1))
                        .onTapGesture{
                            selectCategory[4].toggle()
                            
                        }
                    Text("junk food").padding().lineLimit(1)
                        .foregroundColor(selectCategory[5] ? Color.blue : Color.red)
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(selectCategory[5] ? Color.blue : Color.black,lineWidth: 1))
                        .onTapGesture{
                            selectCategory[5].toggle()
                        }
                }
                
                
            }
            .foregroundColor(.black)
            HStack{
                Button("Clear All", action: {
//                      
                }
                ).padding(.horizontal,50)
                    .font(.system(size:20,weight: .medium)).foregroundColor(Color("DarkShade"))
                   .cornerRadius(10)
                
                
                
//
                
                Button("Apply", action: {
                    
                    filterAction()
                    showFilter = false
                }).padding(.horizontal, 40).padding(.vertical,10).font(.system(size:20,weight: .medium)).background(Color("DarkShade")).foregroundColor(.white)
                    

                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.clear),lineWidth: 1)).cornerRadius(10)
            }
        }
        .padding(15)
        
        .foregroundColor(.black).background(.white).cornerRadius(10)
        
        .shadow(color: Color(hue: 1.0, saturation: 0.047, brightness: 0.672), radius: 30).padding(.trailing)
    }
}
//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
