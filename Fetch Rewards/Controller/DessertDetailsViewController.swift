//
//  DessertDetailsViewController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/30/22.
//

import UIKit

class DessertDetailsViewController: UIViewController {
    
    var mealID: Int?
    var mealDetails: MealDetails?
    
    override func viewWillAppear(_ animated: Bool) {
        if let mealID = mealID {
            MealsModelController().getMealDetails(for: mealID) { details in
                self.mealDetails = details
            }
        }
    }
}
