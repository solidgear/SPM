//
//  ItemCell.swift
//  SPM
//
//  Created by Gonzalo Gonzalez  on 08/02/2020.
//  Copyright © 2020 Gonzalo Gonzalez . All rights reserved.
//

import UIKit

final class ItemCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    fileprivate var name : String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    fileprivate var price : String = "" {
        didSet {
            priceLabel.text = price
        }
    }
    
    fileprivate var category : String = "" {
        didSet {
            categoryLabel.text = category
        }
    }
    
    fileprivate var brand : String = "" {
        didSet {
            brandLabel.text = brand
        }
    }
    
    func configureCell (name: String, price: String, category: String, brand: String) {
        self.name = name
        self.price = price
        self.category = category
        self.brand = brand
    }
}
