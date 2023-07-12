//
//  CrashView.swift
//  FirebaseBootcamp
//
//  Created by Sai Jannali on 6/17/23.
//

import SwiftUI

struct CrashView: View {
    var body: some View {
        ZStack {
            VStack {
                Button("Click me 1") {
                    let myString: String? = nil
                    let string2 = myString!
                }
                
                Button("crash 2"){
                    fatalError("Fatal error")
                }
                
                Button("crash 3") {
                    let arr = [1]
                    let item =  arr[2]
                }
            }
        }
    }
}

struct CrashView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CrashView()
        }
        
    }
}
