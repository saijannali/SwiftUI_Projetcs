//
//  WeakSelfBootcamp.swift
//  SwiftUI Advanced Learning
//
//  Created by Sai Jannali on 7/6/23.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate", destination: WeakSelfSecondScreen())
                .navigationTitle("Screen 1")
            
        }
        .overlay(alignment: .topTrailing) {
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green.cornerRadius(10))
        }
    }
}

struct WeakSelfSecondScreen: View {
    @StateObject var vm = WeakSelfSecondScreenVM()
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

final class WeakSelfSecondScreenVM: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("Init now")
        let currCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(currCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("deinit now")
        let currCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(currCount - 1, forKey: "count")
    }
    
    func getData() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "new data"
        }
        
    }
}

struct WeakSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootcamp()
    }
}

