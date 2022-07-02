//
//  IngredientTableViewCell.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 7/1/22.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    @IBOutlet weak var ingredient: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    func setUp(_ ingredient: Ingredient){
        self.ingredient.text = ingredient.name
        self.quantity.text = ingredient.quantity
    }
}
