//
//  ViewModifierView.swift
//  SwiftUI Advanced Learning
//
//  Created by Sai Jannali on 7/2/23.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    func withDefaultButtonFormatting() -> some View {
        self
            .modifier(DefaultButtonViewModifier())
    }
}

struct ViewModifierView: View {
    var body: some View {
        VStack {
            Text("Hello world")
                .withDefaultButtonFormatting()
            
            
            
            Text("Hello!")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
        }
    }
}

struct ViewModifierView_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierView()
    }
}
