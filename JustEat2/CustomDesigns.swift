//
//  CustomDesigns.swift


import Foundation
import SwiftUI


struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding().frame(width: 200)
            .background(Color("ButtonColor"))
        
            .foregroundColor(.white)
            .clipShape(Capsule()).scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
