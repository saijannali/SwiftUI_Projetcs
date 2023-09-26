//
//  Enums.swift
//  SwiftUI Advanced Learning
//
//  Created by Sai Jannali on 7/9/23.
//

import Foundation

struct CarModel {
    let brand: CarBrand
    let model: String
}

struct CarBrand {
    let title: String
}

//var car1: CarModel = CarModel(brand: "Ford", model: "Fiesta")
//var car2: CarModel = CarModel(brand: "Ford", model: "Focus")
let brandName = CarBrand(title: "Honda")
var car1: CarModel = CarModel(brand: brandName, model: "Camry")
