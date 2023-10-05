//
//  StructClassActorBootcamp.swift
//  SwiftUI Advanced Learning
//
//  Created by Sai Jannali on 9/25/23.
//

import SwiftUI

struct StructClassActorBootcamp: View {
    var body: some View {
        Text("Hello")
            .onAppear {
                runTest()
            }
    }
}

struct StructClassActorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StructClassActorBootcamp()
    }
}

struct MyStruct {
    var title: String
    
    static let product: String = "sesame"
}

 
extension StructClassActorBootcamp {
    private func runTest() {
        print("Test started")
    }
    
    private func structTest1() {
        let objectA = MyStruct(title: "Starting title")
        print("ObjectA: ", objectA.title)
        
        var objectB = objectA
        print("ObjectB: ", objectB.title)
        
        objectB.title = "Second title"
        print("objectB title changed")
        
        print("ObjectA: ", objectA.title)
        print("ObjectB: ", objectB.title)
    }
}

class MyClass {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func addNode(val: Int){
        
    }
}


//class LinkedList<T>{
//    
//    let head: Node
//    var currentNode: Node? = nil
//    
//    init(headVal: T) {
//        self.head = Node(headVal)
//        self.currentNode = self.head
//    }
//    
//    func addNode(val: T) {
//        currentNode.right = Node(val, nil)
//    }
//}
