//
//  DessertDetailsViewController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/30/22.
//

import UIKit

class DessertDetailsViewController: UIViewController {
    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var instructionDetailsLabel: UILabel!
    
    var mealID: Int?
    var ingredients = [Ingredient]()
    
    override func viewWillAppear(_ animated: Bool) {
        if let mealID = mealID {
            MealsModelController().getMealDetails(for: mealID) { mealDetails in
                DispatchQueue.main.async {
                    self.title = mealDetails.name
                    self.instructionDetailsLabel.text = mealDetails.instructions
                    self.ingredients = mealDetails.ingredients
                    self.ingredientsTableView.reloadData()
                }
            }
        }
    }
}

extension DessertDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ingredientsTableView.dequeueReusableCell(withIdentifier: K.Identifiers.ingredientTableViewCell) as? IngredientTableViewCell
        else { return UITableViewCell() }
        
        let ingredient = self.ingredients[indexPath.row]
        cell.setUp(ingredient)
        
        return cell
    }
}

extension DessertDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
