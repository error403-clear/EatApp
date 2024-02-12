//
//  PasswrdTextField.swift
//
//

import SwiftUI

struct PasswrdTextField: View {
    @Binding private var text: String
    @State private var isSecured: Bool = true
    @Binding private var showError: Bool
    private var title: String
    @FocusState private var showLabel
    @State var borderColor = Color.gray
    
    init(_ title: String, text: Binding<String>, showError: Binding<Bool>) {
        self.title = title
        self._text = text
        self._showError = showError
    }

    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                        .padding()
                        .overlay {
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(borderColor, lineWidth: 2)
                        }
                   
                }
                else {
                    TextField(title, text: $text)
                        .padding()
                        .overlay {
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(borderColor, lineWidth: 2)
                           
                        }

                }
               
            }
            .onChange(of: text, perform: { data in
                showError = false
                borderColor = showError ? Color(.red) : Color(.blue)
//                if we are editing the textfield it will turn blue till we edit it
            })
            .focused($showLabel)
            if showLabel {
                         HStack {
                           Text(title)
                             .padding(.horizontal, 5)
                             .background(Color.white)
                           Spacer()
                         }.padding(.bottom, 50)
                           .padding(.leading, 20)
                           .onAppear(){
                               borderColor = showError ? Color(.red) : Color(.blue)
                           }.onDisappear() {
                               borderColor = showError ? Color(.red) : Color(.gray)
                           }
            }

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }.padding()
        }
    }
    
    
    
    
    struct PasswrdTextField_Previews: PreviewProvider {
        static var previews: some View {
            PasswrdTextField("hi", text: .constant(""), showError: .constant(false))
        }
    }
}
