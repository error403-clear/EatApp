//
//  GetStartedView.swift


import SwiftUI

struct GetStartedView: View {
    @State private var  loginIsActive = false
    @State private var signupIsActive = false
    var body: some View {
            ZStack{
                Color("DarkShade").ignoresSafeArea()
                VStack{
                    HStack{
                        Spacer()
                        Image("PizzaBW").resizable().scaledToFill().frame(width: 150,height: 150)
                    }
                    Spacer()
                    HStack{
                        Text("Food For You")
                            .font(.custom("SnellRoundhand", size: 30))
                        // Adjust font and size as desired
                            .fontWeight(.bold)
                            .foregroundColor(.black) 
                        // Text color
                        Text("..")
                            .font(.custom("SnellRoundhand", size: 30))
                            .foregroundColor(.white)
                        
                    }
                    Text("With Greatest Ingredient")
                        .font(.caption2)
                    NavigationLink(destination: Login(), isActive: $loginIsActive){
                        SecondaryButton(btnTitle: "LogIn") {
                            loginIsActive = true
                        }.padding()
                    }
                    
                    NavigationLink(destination: SignUp(), isActive: $signupIsActive){
                        CustomButton(btnTitle: "SignUp"){
                            signupIsActive = true
                        }
                        .padding()
                    }
                     
                    Spacer()
                    HStack{
                        Spacer()
                        Image("Pizza").resizable().scaledToFill().frame(width: 150, height: 150)
                    }
                }
            }.navigationBarBackButtonHidden(true) 
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
