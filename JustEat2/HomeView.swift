//
//  HomeView.swift

import SwiftUI

struct HomeView: View {
    @ObservedObject var apiData: ApiData
    @State var temp: [HotelModel]
    @State var searchData = " "
    @State private var showSort = false
    @State private var selectedSort = [false, false, false, false,false,false,false]
    @State private var selectedFilter = [false,false,false,false,false,false,false,false,false,false,false,false]
    @State private var sortDialogueValue = 0
    @State private var sortTypeSelected: Int = 0
    @Binding var isPressed: Bool
    @State var vegSelected: Bool
    @State private var showFilter:Bool = false
    @State private var minPrice:String = ""
    @State private var maxPrice:String = ""
    @State private var pressed = false
    
    var body: some View  {
        VStack{
            HStack{
                Image(systemName: "magnifyingglass").foregroundColor(Color("DarkShade"))
                TextField("Restaurant name or dish", text: $searchData).textInputAutocapitalization(.never)
                    .foregroundColor(Color.black)
                    .font(Font.custom("gray", size: 16))
                    .onChange(of: searchData){ item in
                        temp = searchRestraunt(query: item, data: apiData.restraunts)
                    
                }
                Text("|")
                Image(systemName: "mic").foregroundColor(Color("DarkShade"))
            }.padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray)).background(.white).cornerRadius(10)
                .padding().shadow(radius: 20).autocorrectionDisabled()
                .shadow(color: Color(hue: 1.0, saturation: 0.003, brightness: 0.904), radius: 30)
            //                                              SORT
            
            Group{
                HStack{
                    Button(action:{
                        showSort = true
                    }){
                        Image(systemName: "slider.horizontal.3")
                        Text("sort")
                        
                    }.padding(10)
                    .foregroundColor(Color("DarkShade")).background(.white).cornerRadius(10)
                    .shadow(color: Color(hue: 1.0, saturation: 0.047, brightness: 0.672), radius: 30).padding(.leading)
                    
                    Button(action:{
                        showFilter = true
                    }, label: {
                        Image(systemName: "loupe")
                        Text("filter")
                    }).padding(10)
                        .foregroundColor(Color("DarkShade")).background(.white).cornerRadius(10)
                        .shadow(color: Color(hue: 1.0, saturation: 0.047, brightness: 0.672), radius: 30).padding(.leading)
                }
            }
            
            List{
                ForEach(temp, id: \.id) { item in
                    ZStack{
                        NavigationLink(destination: RestrauntItems(foods: apiData.foods, restraunt: item)) {
                            EmptyView()
                        }.opacity(0.0).buttonStyle(PlainButtonStyle())
                        ProductCard(restraunt: item, food: apiData.foods[item.id! % 20])
                    }
                }.listRowSeparator(.hidden)
            }.listStyle(.plain)
        }.padding(.bottom, 10)
        .sheet(isPresented: $showFilter) {
            FilterView(minPrice: $minPrice, maxPrice: $maxPrice, vegSelected: $vegSelected, filterAction: {
                showFilter = false
                temp = searchRestraunt(query: searchData, data: apiData.restraunts)
            }).presentationDetents([.height(UIScreen.main.bounds.height*0.7)])
        }
        
        .sheet(isPresented: $showSort) {
            VStack(alignment: .leading, spacing: 10){
                Text("Sort").font(.title.weight(.medium))
                Divider().frame(height: 8)
                HStack{
                    Text("Rating: High to Low").font(.title2.weight(.light))
                    Spacer()
                    Circle()
                        .foregroundColor(selectedSort[0] ? Color.pink : Color.clear)
                        .frame(width: 10)
                        .padding(4)
                        .overlay(Circle().stroke(selectedSort[0] ? Color.pink : Color.gray, lineWidth: 2))
                    
                }.contentShape(Rectangle())
                    .padding(.horizontal, 16).padding(.vertical, 10)
                    .onTapGesture(perform: {
                        updateRadioButton(selected: 0)
                    })
                
                HStack{
                    Text("Delivery Time: Low to High").font(.title3.weight(.light))
                    Spacer()
                    Circle()
                        .foregroundColor(selectedSort[1] ? Color.pink : Color.clear)
                        .frame(width: 10)
                        .padding(4)
                        .overlay(Circle().stroke(selectedSort[1] ? Color.pink : Color.gray, lineWidth: 1))
                    
                }.contentShape(Rectangle())
                    .padding(.horizontal, 16).padding(.vertical, 8)
                    .onTapGesture(perform: {
                        updateRadioButton(selected: 1)
                    })
                
                HStack{
                    Text("Delivery Time & Relevance").font(.title3.weight(.light))
                    Spacer()
                    Circle()
                        .foregroundColor(selectedSort[2] ? Color.pink : Color.clear)
                        .frame(width: 10)
                        .padding(4)
                        .overlay(Circle().stroke(selectedSort[2] ? Color.pink : Color.gray, lineWidth: 1))
                    
                }.contentShape(Rectangle())
                    .padding(.horizontal, 16).padding(.vertical, 8)
                    .onTapGesture(perform: {
                        updateRadioButton(selected: 2)
                    })
                //
                HStack{
                    Text("Distance: Low To High").font(.title3.weight(.light))
                    Spacer()
                    Circle()
                        .foregroundColor(selectedSort[3] ? Color.pink : Color.clear)
                        .frame(width: 10)
                        .padding(4)
                        .overlay(Circle().stroke(selectedSort[3] ? Color.pink : Color.gray, lineWidth: 1))
                    
                }.contentShape(Rectangle())
                    .padding(.horizontal, 16).padding(.vertical, 8)
                    .onTapGesture(perform: {
                        updateRadioButton(selected: 3)
                    })
                
                HStack{
                    Text("Cost: Low to High").font(.title3.weight(.light))
                    Spacer()
                    Circle()
                        .foregroundColor(selectedSort[4] ? Color.pink : Color.clear)
                        .frame(width: 10)
                        .padding(4)
                        .overlay(Circle().stroke(selectedSort[4] ? Color.pink : Color.gray, lineWidth: 1))
                    
                }.contentShape(Rectangle())
                    .padding(.horizontal, 16).padding(.vertical, 8)
                    .onTapGesture(perform: {
                        updateRadioButton(selected: 4)
                    })
                HStack{
                    Text("Cost: High to Low").font(.title3.weight(.light))
                    Spacer()
                    Circle()
                        .foregroundColor(selectedSort[5] ? Color.pink : Color.clear)
                        .frame(width: 10)
                        .padding(4)
                        .overlay(Circle().stroke(selectedSort[5] ? Color.pink : Color.gray, lineWidth: 1))
                    
                }.contentShape(Rectangle())
                    .padding(.horizontal, 16).padding(.vertical, 8)
                    .onTapGesture(perform: {
                        updateRadioButton(selected: 5)
                    })
                Divider()
            }
            .presentationDetents([.height(UIScreen.main.bounds.height*0.6)])
            .foregroundColor(.black).padding()
            HStack{
                Button("Clear All", action: {
                    for i in (0..<selectedSort.count) {
                        selectedSort[i] = false
                    }
                    sortDialogueValue = 0
                }
                ).padding(.horizontal,50)
                    .font(.system(size:20,weight: .medium)).foregroundColor(Color("DarkShade"))
                        .cornerRadius(10)
                
                Button("Apply", action: {
                    temp = sortRestraunt(sortType: sortDialogueValue, data: temp )
                    showSort = false
                    
                }).padding(.horizontal, 60).padding(.vertical,20).font(.system(size:20,weight: .medium)).background(Color("DarkShade")).foregroundColor(.white)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.clear),lineWidth: 1)).cornerRadius(10)
            }
        }
    }
    
    func sortRestraunt(sortType: Int, data: [HotelModel]) -> [HotelModel] {
        switch sortType{
        case 1:
            return data.sorted(by: {$0.rating!.count > $1.rating!.count})
        case 2:
            return data.sorted(by: {Int($0.distance!)! < Int($1.distance!)!})
        case 3:
            return data.sorted(by: {Int($0.distance!)! < Int($1.distance!)!})
        case 4:
            return data.sorted(by: {Int($0.price!)! > Int($1.price!)! })
        case 5:
            return data.sorted(by: {Int($0.price!)! > Int($1.price!)!})
            
        default:
            return apiData.restraunts
            return data
        }
    }
    
    func updateRadioButton(selected: Int){
        for i in (0...(selectedSort.count-1)){
            if i == selected{
                selectedSort[i] = true
                
            }
            else{
                selectedSort[i] = false
            }
        }
        sortDialogueValue = selected + 1
        
    }
    
    func searchRestraunt(query: String, data: [HotelModel]) -> [HotelModel] {
        if query.count == 0{
            return filterRestraunt(data: data)
        }
        let result = data.filter {
            item in
            return item.name!.lowercased().contains(query)
        }
        return filterRestraunt(data: result)
    }
    func filterRestraunt(data: [HotelModel])-> [HotelModel]{
        
        var val: [HotelModel] = []
        var categorySelected = false
        for i in 0..<selectedFilter.count{
            if selectedFilter[i]{
                categorySelected = true
                let result = data.filter{
                    item in
                    return item.category == "\(i+1)"
                }
                val += result
            }
        }
        if  !categorySelected{
            val = data
        }
        
        if vegSelected{
            let result = val.filter{
                item in return item.isVeg!
            }
            val = result
            
        }
        if minPrice != ""{
            let result = val.filter { item in
                return Int(item.price!)! <= Int(maxPrice) ?? 1000
            }
            val = result
        }
        return sortDialogueValue != 0 ? sortRestraunt(sortType: sortDialogueValue, data: val) : val
    }
    
}

