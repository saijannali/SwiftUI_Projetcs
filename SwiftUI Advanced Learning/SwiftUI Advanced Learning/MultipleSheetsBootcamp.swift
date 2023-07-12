//
//  MultipleSheetsBootcamp.swift
//  SwiftUI Advanced Learning
//
//  Created by Sai Jannali on 7/3/23.
//


/*
 - binding
 - multiple .sheets
 - use $item
 */
 
import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
        VStack {
            Button("Button 1") {
                selectedModel = RandomModel(title: "One")
                
            }
            Button("Button 2") {
                selectedModel = RandomModel(title: "Two")
                
            }
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
    }
}

struct NextScreen: View {
    let selectedModel: RandomModel
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
