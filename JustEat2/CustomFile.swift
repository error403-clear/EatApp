//
//  CustomFile.swift


import SwiftUI

struct CustomFile: View {
    var tfName: String?
    var pswdField: Bool?
    static var LogIn: ((String, String)-> Void)?
    @State private var data = ""
    @State private var labelIsActive = false
    @State private var passIsActive = false
    @State private var borderColor = Color(.gray)
    @Binding var showError: Bool
    
    static var func1: ((String, String)->Void)?
    var body: some View {
        ZStack{
            if pswdField ?? false {
                SecureField(tfName ?? "Password", text: $data, onCommit: {passIsActive = false})
                    .onChange(of: data){ data in
                        showError = false
                        CustomFile.func1?(data,tfName!)
                    }.onTapGesture {
                        passIsActive = true
                    }
                    .padding().overlay {
                        RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( borderColor,lineWidth: 2)
                    }
                if passIsActive{
                    HStack{
                        Text(tfName ?? "Email").font(.system(size: 14)).background(.white)
                        Spacer()
                        
                    }.padding(.bottom, 50).padding(.leading, 20)
                }
            } else {
                TextField(tfName ?? "Email", text: $data){i in
                    if i{
                        labelIsActive = true
                    }
                    //                               }
                    else{
                        labelIsActive = false
                        borderColor = (showError) ? Color(.gray):Color(.red)
                    }
                }
                .onChange(of: data){ Data in
                    CustomFile.func1?(Data,tfName!)
                    borderColor = Color("BlueShade")
                    
                }.onTapGesture {
                    passIsActive = false
                }.onSubmit {
                    borderColor = (showError) ? Color(.red) : Color(.gray)
                    print("error is \(showError)")
                }
                .padding().overlay {
                    RoundedRectangle(cornerRadius: 10, style: .continuous).stroke( borderColor,lineWidth: 2)
                }
            }
            
            if labelIsActive{
                HStack{
                    Text(tfName ?? "Email").font(.system(size: 14)).background(.white)
                    Spacer()
                    
                }.padding(.bottom, 50).padding(.leading, 20)
            }
        }
        .frame(alignment: .leading).onAppear(){
            borderColor = (showError) ? Color(.red) : Color(.gray)
            print("error is \(showError)")
            
        }
    }
}
struct CustomFile_Previews: PreviewProvider {
   static var previews: some View {
        CustomFile(showError: .constant(false))

      }
 }

            

