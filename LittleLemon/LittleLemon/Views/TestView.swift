//
//  TestView.swift
//  LittleLemon
//
//  Created by Sai Jannali on 10/4/23.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        List {
            Section {
                Text("Item 1")
            }
            Section {
                Text("Item 2")
                Text("Item 3")
                Text("Item 4")
            }
            Section {
                Text("Item 5")
                Text("Item 6")
                Text("Item 7")
            }
        }
        .background(.pink)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    TestView()
}
