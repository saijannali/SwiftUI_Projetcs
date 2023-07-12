//
//  ButtonStyleBootcamp.swift
//  SwiftUI Advanced Learning
//
//  Created by Sai Jannali on 7/4/23.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            //.brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

extension View  {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        return self.buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}
struct ButtonStyleBootcamp: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click Me")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
        }
        //.buttonStyle(PressableButtonStyle())
        .withPressableStyle()
        .padding(40)

    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
