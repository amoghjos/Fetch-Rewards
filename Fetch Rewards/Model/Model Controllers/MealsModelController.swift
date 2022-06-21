//
//  MealsModelController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/20/22.
//

import Foundation

//Inspiration: https://www.swiftbysundell.com/articles/model-controllers-in-swift/
struct MealsModelController {
    private let mealsStorage: MealsStorage
    
    init(using mealsStorageMock: MealsStorage){
        self.mealsStorage = mealsStorageMock
    }
    
    func getMeals(for category: MealCategory) -> [Meal] {
        return mealsStorage.getMeals(for: category)
            .filter{
                //remove any empty names
                !$0.name.isEmpty
            }
            .sorted {
                //sort alphabetically
                $0.name.lowercased() < $1.name.lowercased()
            }
    }
}
