//
//  ProductCard.swift
//
//

import SwiftUI

struct ProductCard: View {
    var restraunt: HotelModel
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    var food: FoodItems
    @State private var isLiked: Bool = false
    var body: some View {
        VStack{
            ZStack {
            VStack {
                Image("food")
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height * 0.3 * 0.8)
                    .clipped().cornerRadius(8)
            }
            VStack{
                
                HStack{
                    Text("\(restraunt.name!) ◦ ₹\(restraunt.price!)")
                        .padding(.horizontal, 8)
                        .background(.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.black),lineWidth: 1))

                    
                    Spacer()
                    Button(action: {
//                        isLiked.toggle()
                    }, label:
                    {
                        if isLiked{
                            Image(systemName: "heart.fill")
                                .font(.title)
                                .foregroundColor(.red)
                        }
                        else{
                            Image(systemName: "heart")
                                .font(.title).foregroundColor(.white)
                        }
                    }).onTapGesture {
                        isLiked = !isLiked
                    }
                    
                }
                Spacer()
                HStack(alignment: .bottom){
                    VStack(alignment: .leading){
                        Text(restraunt.name!).font(Font.system(size: 30).bold()).foregroundColor(.white)
                    }
                    Spacer()
                    HStack{
                        Text(restraunt.rating!).foregroundColor(.white).padding(6)
                    }.background(.green).cornerRadius(10)
                    
                }
                //                .
            }.padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3 * 0.8)
                    .clipped()
        }.frame(height: UIScreen.main.bounds.height * 0.3 * 0.8)
        Spacer()
        HStack{
            Image(systemName: "clock.arrow.circlepath")
            Text(restraunt.time())
            Spacer()
            Text("₹" + "\(restraunt.price!)" + " for one")
        }.padding()
        }.frame(height: UIScreen.main.bounds.height * 0.33)
            .background(Color.white)
            .overlay (RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color(.white), lineWidth: 4)).shadow( radius: 30)
    }

}
