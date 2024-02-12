//
//  TabBar.swift



import SwiftUI

struct TabBar: View {
    @State private var tabSelected = 0
    @State private var dataLoad = 0
    @State var apiData = ApiData()
    @Binding var login: Bool
    var body: some View {
        if dataLoad >= 2{
            TabView(selection: $tabSelected){
                
                HomeView(apiData: apiData, temp: apiData.restraunts, searchData: "",isPressed: .constant(false), vegSelected: false)
                    .tabItem{
                    Label("home", systemImage: "house")
                    
                }.tag(0)
                GroceryPage().tabItem{
                    Label("Grocery", systemImage: "list.clipboard").foregroundColor(Color("DarkShade"))
                }.tag(1)
                CartView(selection: $tabSelected).tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }.tag(2)
            }.padding(.top,10)
                .background(.white)
        }
        else{
            ProgressView("Fetching Data")
            .onAppear() {
                NetworkManager.shared.requestForApi(request: "https://retoolapi.dev/UY30s0/hum_name_rahe_hum_jo_the_kabhi", completionHandler: { data in
                    print("on appear called")
                    guard let data = data as? [[String: Any]] else {return}
                    let restraunts: [HotelModel] = data.map{HotelModel(data: $0)}
                    apiData.setRestraunts(restraunts: restraunts)
                    dataLoad += 1
                })
                
                NetworkManager.shared.requestForApi(request: "https://retoolapi.dev/kzWdFZ/jaimatadi", completionHandler: { data in
                    print("on appear called")
                    guard let data = data as? [[String: Any]] else {return}
                    let foods: [FoodItems] = data.map{FoodItems(data: $0)}
                    apiData.setFoods(foods: Array(foods[0...19]))
//                    self.restraurantData1 = data1.map{FoodItems(data: $0)}
                    dataLoad += 1
                })
            }
        }
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(login: .constant(false))
    }
}
