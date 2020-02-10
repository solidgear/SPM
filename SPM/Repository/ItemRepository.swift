//
//  ItemRepository.swift
//  SPM
//
//  Created by Gonzalo Gonzalez  on 08/02/2020.
//  Copyright © 2020 Gonzalo Gonzalez . All rights reserved.
//

import Foundation
import ItemStuff

class ItemRepository {
    
    static let instance = ItemRepository()
    
    private var items: [Item] = []
    
    func getItems(result: @escaping ([Item]) -> Void) {
        items = mock()
        result(items)
    }
    
    //MARK : MOCK
    private func mock () -> [Item] {
    
        let fabadaLitoral = Item(name: "Fabada", description: "", brand: "Litoral", price: 4.99, category: .food)
        let pastaGallo = Item(name: "Macarrones", description: "", brand: "Gallo", price: 2.39, category: .food)
        let televisiorSony = Item(name: "Televisor de 55", description: "", brand: "Sony", price: 799, category: .electronic)
        let pesto = Item(name: "Pesto", description: "", brand: "Alesi", price: 3.99, category: .food)
        let vaqueros = Item(name: "Pantalones", description: "", brand: "Levis", price: 120, category: .clothes)
        let portatil = Item(name: "Portatil de 13", description: "", brand: "Apple", price: 2700, category: .electronic)
        
        
        return [fabadaLitoral, pastaGallo, televisiorSony, pesto, vaqueros, portatil]
    }
}
