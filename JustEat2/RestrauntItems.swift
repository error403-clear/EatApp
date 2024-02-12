//
//  RestrauntItems.swift


import SwiftUI

struct RestrauntItems: View {
    var foods: [FoodItems]
    var restraunt: HotelModel
    var body: some View {
        List{
            HStack{
                VStack(alignment: .leading){
                    Text(restraunt.name!).foregroundColor(.black).font(.system(size: 28, weight: .semibold))
                    Text(getCategory(restraunt.category!))
                    HStack{
                        Text(restraunt.address! ).foregroundColor(Color.gray).font(.callout)
                    }
                    HStack{
                        Image(systemName: "clock").font(.system(size: 20, weight: .medium))
                        Text("\(getEstimatedTime(restraunt.distance!)) | \(restraunt.distance!) km away")
                    }
//

                }
                Spacer()
                VStack{
                    HStack{
                        Text("\(restraunt.rating!)").foregroundColor(.white).font(.title3.weight(.semibold))
                    }
                    .padding(.horizontal).padding(.vertical,8).background(Color(hue: 0.272, saturation: 0.927, brightness: 0.488))
                    VStack{
                        Text(getTotalReviews(foods)).font(.subheadline.weight(.semibold))
                        Text("Reviews").foregroundColor(.gray).font(.caption)
                    }
                }.cornerRadius(20).overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black.opacity(0.3),lineWidth: 2))
                
                
            }.padding().listRowSeparator(.hidden).background(.white).cornerRadius(20)
                .shadow(radius: 5)
                ForEach(foods, id: \.id) {
                    items in RestrauntPage(distance: restraunt.distance!, restrauntid: String(restraunt.id!), food: items)
                    
                
                }
            
        }.listStyle(.plain)
            .padding(.top, 2)
        }
    
    func getTotalReviews(_ dishes: [FoodItems]) -> String {
        var sum = 0
        for dish in dishes {
            sum += Int(dish.totalVotes!)!
        }
        return String(sum)
    }
    
    func getEstimatedTime(_ distance: String) -> String {
        let t = 10 + (Int(distance)! * 5)
        return "\(t) - \(t+5) min"
    }
    
    
    func getCategory(_ category: String) -> String {
        switch(category) {
        case "1":
            return "North Indian"
        case "2":
            return "South Indian"
        case "3":
            return "Pizza & Burgers"
        case "4":
            return "Desert"
        case "5":
            return "Chinese"
        case "6":
            return "Starters"
        default:
            return "El Gurerro"
        }
    }
    }


//struct RestrauntItems_Previews: PreviewProvider {
//    static var previews: some View {
//        RestrauntItems(foods: <#[FoodItems]#>)
//    }
//}
