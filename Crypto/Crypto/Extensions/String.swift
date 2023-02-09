//
//  String.swift
//  Crypto
//
//  Created by Sai Jannali on 2/8/23.
//

import Foundation

extension String {
    
    var removeHTML: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    
}
