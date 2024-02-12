//
//  RestrauntPage.swift


import SwiftUI

struct RestrauntPage: View {
    @State private var isClicked = false
    @State private var descriptionLineLimit = 3
    @EnvironmentObject var settings: UserSettings
    @State private var showDSSAlert = false
    @State private var cartItems: [Cart] = []
    @State private var currentItemId: String = "0"
    @State private var qunatity = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var distance: String
    var restrauntid: String
    var food: FoodItems

    var body: some View {

            
            HStack{
                
                VStack(alignment: .leading){
                    Image(systemName: "dot.squareshape").foregroundColor(food.isVeg! ? .green : .red )
                    Text("\(food.name!)").font(.system(size: 18, weight: .semibold))
                    HStack{
                        Text("\(food.rating!)").foregroundColor(.white).padding(6).overlay(RoundedRectangle(cornerRadius: 3).stroke(lineWidth: 2)).background(.green).border(.gray)
                        Text("\(food.totalVotes!)").font(.system(size: 17, weight: .regular))
                    }
                    
                    Text("₹" + "\(food.price!)")
                    Text("\(food.description!)").font(.system(size: 17, weight: .regular)).foregroundColor(.gray).lineLimit(descriptionLineLimit)
                        .onTapGesture {
                            descriptionLineLimit = descriptionLineLimit == 3 ? 7 : 3
                        }
                    
                }
                Spacer()
                VStack{
                    AsyncImage(url: URL(string: food.image!)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
                    .cornerRadius(20)
                    .clipped()
                        
                    Button("ADD +", action: {
                        withAnimation {
                                       self.isClicked.toggle()
                                   }
                        addToCart()
                    })
                    .scaleEffect(isClicked ? 2 : 1)
                    .onTapGesture(perform: {
                        addToCart()
                        
                    })
                    .padding(.horizontal, 20)
                        .foregroundColor(Color("DarkShade"))
                        .font(.headline.weight(.heavy)).padding().background(Color("LightShade")).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("DarkShade"), lineWidth: 3))
                        .cornerRadius(20)
                        .padding(-30)
                }
                .padding(.bottom,20)
                    
                
                
            }
       
            
        }
    func addToCart() {
        if (settings.user?.cartItem?.count == 0 || restrauntid == settings.user?.restrauntid ?? "0"){
            settings.user?.restrauntid = restrauntid

            PersistenceController.shared.saveCartItem(data: ["name": food.name!, "veg": food.isVeg!, "price": food.price!, "user": settings.user, "distance": distance, "restrauntid": restrauntid])
        }
        else{
            showDSSAlert = true
            print("Cart not empty")
        }
    }
}


