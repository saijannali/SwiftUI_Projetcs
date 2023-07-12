//
//  HashableBootcamp.swift
//  SwiftUI Advanced Learning
//
//  Created by Sai Jannali on 7/4/23.
//

import SwiftUI

struct MyCustomModel: Hashable{
    let id = UUID().uuidString
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "one"),
        MyCustomModel(title: "two"),
        MyCustomModel(title: "three"),
        MyCustomModel(title: "four"),
        MyCustomModel(title: "five")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                //                ForEach(data) { item in
                //                    Text(item.id)
                //                        .font(.headline)
                //                }
                ForEach(data, id: \.self) { item in
                    Text(item.title )
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
