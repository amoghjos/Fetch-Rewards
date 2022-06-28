//
//  ViewController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    var mealsModelController = MealsModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealsModelController.getMeals(for: .dessert){ meals in
            print(meals)
        }
    }
}

