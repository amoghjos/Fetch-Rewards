//
//  MealDetailViewController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 1/23/23.
//

import UIKit

class MealDetailViewController: UIViewController {

    var mealID: Int?
    
    init(with mealID: Int) {
        super.init(nibName: nil, bundle: nil)
        self.mealID = mealID
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        guard let mealID = mealID else { return }
        loadMealDetails(for: mealID)
    }
    
    private func loadMealDetails(for mealID: Int) {
        MealsModelController().getMealDetail(for: mealID) { mealDetail in
            //update properties
            print(mealDetail)
        }
    }
}
