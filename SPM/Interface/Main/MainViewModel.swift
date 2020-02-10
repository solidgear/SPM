//
//  MainViewModel.swift
//  SPM
//
//  Created by Gonzalo Gonzalez  on 08/02/2020.
//  Copyright © 2020 Gonzalo Gonzalez . All rights reserved.
//

import Foundation
import ItemStuff

class MainViewModel {
    
    var itemRepository: ItemRepository
    
    var userNotVerified: (() -> Void)?
    
    var itemsCollectionUpdated: (() -> Void)?
    var itemsCollection: [Item]{
        didSet{
            itemsCollectionUpdated?()
        }
    }

    init (itemRepository: ItemRepository){
        self.itemRepository = itemRepository
        self.itemsCollection = []
    }
    
    func sessionVerification () {
        userNotVerified?()
    }
    
    func loadItems () {
        itemRepository.getItems { (items) in
            self.itemsCollection = items
        }
    }
}
