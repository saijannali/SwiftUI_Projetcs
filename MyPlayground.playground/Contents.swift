//import UIKit
//
//class MyHashSet {
//
//    var hashSet: [Int]
//
//    init() {
//        hashSet = []
//    }
//    
//    func add(_ key: Int) {
//        if hashSet.contains(key) {
//            print(hashSet)
//            return
//        } else {
//            hashSet.append(key)
//            print(hashSet)
//        }
//    }
//    
//    func remove(_ key: Int) {
//        for i in 0..<hashSet.count {
//            if hashSet[i] == key {
//                hashSet.remove(at: i)
//                print(hashSet)
//                return
//            }
//        }
//    }
//    
//    func contains(_ key: Int) -> Bool {
//        return hashSet.contains(key)
//    }
//}
//
//var myHashSet = MyHashSet();
//myHashSet.add(1);      // set = [1]
//myHashSet.add(2);      // set = [1, 2]
//myHashSet.contains(1); // return True
//myHashSet.contains(3); // return False, (not found)
//myHashSet.add(2);      // set = [1, 2]
//myHashSet.contains(2); // return True
//myHashSet.remove(2);   // set = [1]
//myHashSet.contains(2); // return False, (already removed)


//enum Pasta: Int, CaseIterable{
//    case spa = 8
//    case penene = 9
//    case rav = 10
//    case rigato = 12
//}
//
//let count = Pasta.allCases.count
//print(count)
//
//enum PastaTypesA {
//    case spaghetti(cookingTime: Int)
//    case penne(cookingTime: Int)
//    case raviolo(cookingTime: Int)
//    case fusilli(cookingTime: Int)
//    case rigatoni(cookingTime: Int)
//}
//
//let cookingTimed = PastaTypesA.spaghetti(cookingTime: 8)
//
//func checkIfCooked(for pasta: PastaTypesA) {
//    switch pasta {
//    case .spaghetti(let time) where time >= 8:
//        print("is cooked, take it out")
//    default: print("let it cook")
//    }
//}
//
//checkIfCooked(for: cookingTimed)
//
//
//enum Ingredient: String{
//    case tomatoes = "red tomatoes"
//    case lettuce = "romaine lettuce"
//    case chicken = "chicken"
//}
//
//let ingredient = Ingredient.lettuce
//
//switch ingredient {
//case .lettuce:
//    print("is lettuce", ingredient.rawValue)
//case .chicken:
//    print("is chicen", ingredient.rawValue)
//case .tomatoes:
//    print("is tomatoes", ingredient.rawValue)
//}
//
//enum RecipieInformation {
//    case allergens(information: String)
//}
//
//let recipieInformation = RecipieInformation.allergens(information: "peanuts, milk and gluten")
//
//switch recipieInformation {
//case .allergens(let info):
//    print("info: ", info)
//}
//
//
//enum Cheese{
//    case Ricotto
//    case Mozer
//    var desc: String {
//        switch self {
//        case .Ricotto:
//            return "is Ricotto"
//        case .Mozer:
//            return "is Mozerella"
//        }
//    }
//}
//
//let cheese = Cheese.Mozer
//print(cheese.desc)

//var pastaTypeSet = Set<String>()
//var pastatTypeArray = Array<String>()
//
//pastaTypeSet.insert("Tagliatelle")
//pastaTypeSet.insert("Fettucine")
//pastaTypeSet.insert("Spaghetti")
//pastaTypeSet.insert("Linguine")
//
//pastaTypeSet.remove("Linguine")
//
//
//var phone = Set<String>()
//var inPerson = Set<String>()
//var internet = Set<String>()
//
//let inPersonAndOverPhone = phone.union(inPerson)
//
//var confirmationCodes : Set<String> = ["LL3450","LL3451"]

//var l: Set = ["a", "b"]
//
//l.insert("c")
//
//print(l)
//
//
//enum p: Int, CaseIterable{
//    case mon = 1
//    case tue, wed, thu, fri, sat, sun
//    
//}
//
//for day in p.allCases {
//    print("\(day) is day \(day.rawValue) of the week")
//}
//
//enum PastaTypes: Int {
//    case spaghetti
//    case penne
//    case ravioli
//    case rigatoni
//}
//
//print(PastaTypes.penne.rawValue)


//import Foundation
//
//protocol Dish {
//    var name: String { get }
//    var preperationMinutes: Int {get set}
//    
//    func prepare()
//    func plate(artisticLevel: Int)
//}
//
//class MainDish: Dish {
//    let name: String
//    var preperationMinutes: Int
//    
//    init(name: String, preperationMinutes: Int) {
//        self.name = name
//        self.preperationMinutes = preperationMinutes
//    }
//    
//    func prepare() {
//        print("Preparing \(name) for \(preperationMinutes) minutes")
//    }
//    
//    func plate(artisticLevel: Int) {
//        print("Plate artistic level: \(artisticLevel)")
//    }
//}
//
//let dish = MainDish(name: "Super Spaghetti", preperationMinutes: 35)
//dish.prepare()
//dish.plate(artisticLevel: 10)

//protocol Driver {
//    var name: String { get }
//    func driveToDestination(_ destination: String, with food: String)
//}
//
//class DeliveryDriver: Driver {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    
//    func driveToDestination(_ destination: String, with food: String) {
//        print("\(name) is driving to \(destination) to deliver \(food).")
//    }
//}
//
//class LittleLemon {
//    var deliveryDriver: Driver?
//    func deliverFood(_ food: String, to destination: String) {
//        if let deliveryDriver = deliveryDriver {
//            deliveryDriver.driveToDestination(destination, with: food)
//        } else {
//            print("No driver to delegate delivery")
//        }
//    }
//        
//}
//    
//
//let bob = DeliveryDriver(name: "Bob")
//let littleLemon = LittleLemon()
//
//littleLemon.deliverFood("Super Spaghetti", to: "1 Spagetti Lane")
//littleLemon.deliveryDriver = bob
//littleLemon.deliverFood("Super Spaghetti", to: "1 Spagetti Lane")
//
//enum RegistrationFormErrors: Error {
//    case usernameEmpty
//    case passwordEmpty
//    case paswordTooShort
//}
//
//func example() throws {
//    throw RegistrationFormErrors.usernameEmpty
//}
//
//
////
//
//class Calculator {
//    func divide(x: Double, y: Double) throws -> Double{
//        if y == 0 {
//            throw CalculatorError.divisionByZero
//        }
//        return x / y
//    }
//}
//
//let calculator = Calculator()
//let result = try? calculator.divide(x: 10, y: 2)
//
//enum CalculatorError: Error {
//    case divisionByZero
//}
//
//
//do {
//    try calculator.divide(x: 10, y: 0)
//} catch CalculatorError.divisionByZero {
//    print("cant divide by zero")
//}


struct Order {
    let price: Int
    let location: String
}
 
func totalRevenueOf(orders: [Order],  location: String) -> Int {
    let ordersAtLocation = orders.filter{ $0.location == location }
    return 0
}
 
let orders = [
    Order(price: 24, location: "New York"),
    Order(price: 37, location: "San Francisco"),
    Order(price: 101, location: "New York"),
]
 
let result = totalRevenueOf(orders: orders, location: "New York")
print(result)
