import UIKit

class MyHashSet {

    var hashSet: [Int]

    init() {
        hashSet = []
    }
    
    func add(_ key: Int) {
        if hashSet.contains(key) {
            print(hashSet)
            return
        } else {
            hashSet.append(key)
            print(hashSet)
        }
    }
    
    func remove(_ key: Int) {
        for i in 0..<hashSet.count {
            if hashSet[i] == key {
                hashSet.remove(at: i)
                print(hashSet)
                return
            }
        }
    }
    
    func contains(_ key: Int) -> Bool {
        return hashSet.contains(key)
    }
}

var myHashSet = MyHashSet();
myHashSet.add(1);      // set = [1]
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(1); // return True
myHashSet.contains(3); // return False, (not found)
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(2); // return True
myHashSet.remove(2);   // set = [1]
myHashSet.contains(2); // return False, (already removed)
