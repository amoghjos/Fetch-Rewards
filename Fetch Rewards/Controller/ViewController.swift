//
//  ViewController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/14/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let model = MealsModelController()
        let meals = model.getMeals(for: .dessert)
        print(meals)
    }


}

