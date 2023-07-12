//
//  MVVMBootcamp.swift
//  SwiftUI Advanced Learning
//
//  Created by Sai Jannali on 7/5/23.
//

import SwiftUI

final class MyManagerClass {
    func getData() async throws -> String {
        "Some Data!"
    }
}

actor MyManagerActor {
    
}

final class MVVMBootcampViewModel: ObservableObject {
    
    let managerClass = MyManagerClass()
    let managerActor = MyManagerActor()
    
    private var tasks: [Task<Void, Never>] = []
    
    @Published private(set) var myData = "Starting text"
    
    func buttonClicked() {
        Task {
            do{
                myData = try await managerClass.getData()
            } catch {
                print(error)
            }
        }
        
    }
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
}

struct MVVMBootcamp: View {
    
    @StateObject private var viewModel = MVVMBootcampViewModel()
    
    
    var body: some View {
        Button("Click") {
            viewModel.buttonClicked()
        }
        .onDisappear {
            
        }
    }
}

struct MVVMBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MVVMBootcamp()
    }
}
