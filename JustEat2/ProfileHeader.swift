//
//  ProfileHeader.swift


import SwiftUI

struct ProfileHeader: View {
        @State var title: String
        @State private var isTrue = false
        @State private var showAlert = false
        var body: some View {
            
            ZStack{
                Color.clear.background(.ultraThinMaterial)
                HStack{
                    Text(title).frame(maxWidth: .infinity).font(.largeTitle)
                    Spacer()
                    Button(action:{}){
                        Image(systemName: "mappin").font(.title).foregroundColor(Color("DarkShade"))
                    }

                    Button{
                        showAlert.toggle()
                    } label: {
                        Image(systemName: "character.book.closed.hi").font(.title).foregroundColor(Color("DarkShade"))
                    }
                    .alert( isPresented: $showAlert){
                        Alert(
                            title: Text("Change the language from phone settings"),
                            primaryButton: .destructive(Text("cancel")){},
                            secondaryButton:
                                    .default(Text("settings"))
    //                                .destructive(Text("cancel")){}
                                
                            )
                        
                    }

                }
            }.padding(.horizontal,20)
                .frame(height: 70)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }


struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(title: "Profile")
    }
}
