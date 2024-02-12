//
//  CustomButton.swift
//
//

import SwiftUI

struct CustomButton: View {
    var btnTitle: String
    var action: (() -> Void)?    
    var body: some View {
        Button(action: action ?? {
            print("No Action")
        },label: {
            Spacer()
            Text(btnTitle)
                .font(.title3.weight(.semibold))
            Spacer()
        })
        .padding()
        .frame(maxWidth: .infinity)
        .overlay {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .stroke(Color("ButtonColor"), lineWidth: 2)
        }
        .foregroundColor(.white)
    }
}

struct SecondaryButton: View{
    var btnTitle: String
    var action: (() ->Void)?
    
    var body: some View {
        Button(action: action ?? {
            print("no action")
        }, label: {
            Spacer()
            Text(btnTitle)
                .font(.title3.weight(.semibold))
            Spacer()
            
        }).padding()
          .frame(maxWidth: .infinity)
          .background(Color("ButtonColor"))
          .cornerRadius(15)
          .foregroundColor(.white)
    }
     
}
//struct SecondaryButton_Previews: PreviewProvider{
//    static var previews: some View{
//        SecondaryButton()
//    }
//}



struct CartItemIncrement: View{
    @Binding var count: Int
    var body: some View{
        VStack{
            HStack{
                Divider().frame(height: 20)
                Button("-", action:{
                    if count>=1{
                        self.count -= 1
                    }
                })
                Divider().frame(height: 20)
                Text("\(count)")
                Divider().frame(height: 20).border(Color.pink)
                Button("+",action: {
                    self.count += 1
                })
                Divider().frame(height: 20)
                
            }.overlay{RoundedRectangle(cornerRadius: 5,style: .continuous).stroke(.pink, lineWidth: 2)}
        }
    }
}
//
//struct CartItemIncrement_Previews: PreviewProvider{
//    static var previews: some View{
//        CartItemIncrement(count: .constant(1))
//    }
//}
