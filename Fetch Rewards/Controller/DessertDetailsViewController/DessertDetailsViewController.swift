//
//  DessertDetailsViewController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/30/22.
//

import UIKit

class DessertDetailsViewController: UIViewController {
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    var mealID: Int?
    
    override func viewWillAppear(_ animated: Bool) {
        if let mealID = mealID {
            MealsModelController().getMealDetails(for: mealID) { mealDetails in
                DispatchQueue.main.async {
                    self.title = mealDetails.name
                }
            }
        }
    }
}

extension DessertDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ingredientsTableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell")!
        return cell
    }
}
