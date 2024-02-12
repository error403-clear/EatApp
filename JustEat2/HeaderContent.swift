//
//  HeaderContent.swift
//
//

import SwiftUI

struct HeaderContent: View {
    @State var pageTitle: String
    @State private var isTrue = false
    @State private var showAlert = false
    @State var profilePage = false
    var body: some View {
        
        ZStack{
            Color.clear.background(.ultraThinMaterial)
            HStack{
                    NavigationLink(destination: ProfilePage(profilePage:  $profilePage, log: .constant(false)) , isActive: $isTrue){
                        Button(action:{
                            isTrue = true
                        }){
                            Image(systemName: "figure.wave").font(.title).foregroundColor(Color("DarkShade"))
                        }
                }
                Text(pageTitle).frame(maxWidth: .infinity).font(.largeTitle)
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

                            
                        )
                    
                }

                
                
            }
        }.padding(.horizontal,20)
            .frame(height: 70)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct HeaderContent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderContent(pageTitle: "")
    }
}
