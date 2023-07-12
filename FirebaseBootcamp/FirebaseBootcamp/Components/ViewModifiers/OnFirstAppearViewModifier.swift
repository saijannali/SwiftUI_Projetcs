//
//  OnFirstAppearViewModifier.swift
//  FirebaseBootcamp
//
//  Created by Sai Jannali on 6/17/23.
//

import Foundation
import SwiftUI

struct onFirstAppearViewModifier: ViewModifier {
    @State private var didAppear: Bool = false
    let perform: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if !didAppear {
                    perform?()
                    didAppear = true
                }
            }
    }
}


extension View {
    func onFirstAppear(perform: (() -> Void)?) -> some View{
        modifier(onFirstAppearViewModifier(perform: perform))
    }
}


