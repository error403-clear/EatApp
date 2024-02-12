//
//  SignUp.swift
//

import SwiftUI


struct SignUp: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var userSetting: UserSettings
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var dob = ""
    @State private var showErrorName:Bool = false
    @State private var showErrorEmail:Bool = false
    @State private var showErrorPassword:Bool = false
    @State private var showErrorDob:Bool = false
    @State private var EmailLableValue = false
    @State private var tapCount = UserDefaults.standard.value(forKey: "Tap")
    @State private var loginIsActive = false
    @State private var ddTF = ""
    @State private var mmTF = ""
    @State private var yyTF = ""
    var showError: Bool?=false
    @FocusState var isEmailFocused
    @FocusState var isPassFocused
    @FocusState var isNameFocused
    @FocusState var isDateFocused
    @State private var showAlert = false
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        VStack{
            Text("SignUp")
                .foregroundStyle(Color("DarkShade"))
                .font(.headline)
            
            Image("Image 2").resizable().scaledToFill().frame(width:40,height: 200).padding(.vertical,50)
            
            CustomTextField("Name", showError: $showErrorName, text: $name)
                .focused($isNameFocused)
                .onSubmit {
                showErrorName = !isValidName(name)
                isEmailFocused.toggle()
                
            }
            CustomTextField("Email", showError: $showErrorEmail, text: $email).focused($isEmailFocused)
                .onSubmit {
                    showErrorEmail = !isValidEmail(email)
                    isPassFocused.toggle()
                    
                }
            PasswrdTextField("Password",text: $password, showError: $showErrorPassword).focused($isPassFocused)
                .onSubmit {
                 showErrorPassword = !isValidPassword(password)
                    isDateFocused.toggle()
                }
            
                
            DateTextField(ddTF: $ddTF, mmTF: $mmTF, yyTF: $yyTF, showError: $showErrorDob).keyboardType(.asciiCapableNumberPad).focused($isDateFocused)
                .onSubmit {
                    //
                    isDateFocused.toggle()
                }
                Button("Sign Up"){
                    if isValidName(name){
                        if isValidEmail(email){
                            if isValidPassword(password){
                                if isValidDate(day: ddTF, month: mmTF, year: yyTF){
                                    let user = User(context: viewContext)
                                    user.email = email
                                    user.password = password
                                    user.username = name
                                    user.dob = dob
                                    try? viewContext.save()
                                    showAlert = true
                                } else{
                                    showErrorDob = true
                                    isDateFocused.toggle()
                                }
                            }else{
                                showErrorPassword = true
                                isPassFocused.toggle()
                            }
                        }
                        else{
                            showErrorEmail = true
                            isEmailFocused.toggle()
                        }
                    }
                    else{
                        showErrorName = true
                        isNameFocused.toggle()
                    }
                    
                }
                .alert("Signed Up Successfully", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {
                        self.presentation.wrappedValue.dismiss()
                    }
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(20)
                .background(Color.white)
            }.padding(24)
            
        }
        func isValidName(_ name: String) -> Bool {
            let RegEx = "\\w{2,26}"
            let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
            return Test.evaluate(with: name)
        }
        
        
        func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            print("email is \(email)")
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
        func isValidPassword(_ email: String) -> Bool {
            let emailRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
            print("email is \(email)")
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
    func isValidDate(day: String, month: String, year: String) -> Bool {
        guard let day = Int(day) else {return false}
        guard let month = Int(month) else {return false}
        guard let year = Int(year) else {return false}
        var m = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        if year >= 2023 {
          return false
        }
        if month < 1 || month > 12 {
          return false
        }
        if year % 4 == 0 {
          if !(year % 100 == 0 && year % 400 != 0) {
            m[1] = 29
          }
        }
        if day < 1 || day > m[month-1] {
          return false
        }
        return true
      }
        
    }
    
    
    
    struct SignUp_Previews: PreviewProvider {
        static var previews: some View {
            SignUp()
        }
    }
    

