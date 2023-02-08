//
//  UIApplication.swift
//  Crypto
//
//  Created by Sai Jannali on 2/5/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
