//
//  Item.swift
//  SPM
//
//  Created by Gonzalo Gonzalez  on 08/02/2020.
//  Copyright © 2020 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

class Item {
    
    enum Category: String {
        case food = "Food"
        case electronic = "Electronic"
        case furniture = "Furniture"
        case clothes = "Clothes"
    }
    
    var name: String
    var description: String
    var brand: String
    var price: Float
    var category: Category
    
    init(name: String, description: String, brand: String, price: Float, category: Category) {
        self.name = name
        self.description = description
        self.brand = brand
        self.price = price
        self.category = category
    }
}
