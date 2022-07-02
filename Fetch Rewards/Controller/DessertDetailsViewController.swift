//
//  DessertDetailsViewController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/30/22.
//

import UIKit

class DessertDetailsViewController: UIViewController {
    
    var mealID: Int?
    
    override func viewWillAppear(_ animated: Bool) {
        MealsModelController().getMealDetails(for: mealID!) { details in
            print(details)
        }
    }
}
