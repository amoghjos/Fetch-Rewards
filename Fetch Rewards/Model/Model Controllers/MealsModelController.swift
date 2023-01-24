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
    
    init(using mealsStorageMock: MealsStorage = TheMealDBNetworkEngine()){
        self.mealsStorage = mealsStorageMock
    }
    
    func getMeals(for category: MealCategory, completion: @escaping ([Meal]) -> Void ) {
        mealsStorage.getMeals(for: category) { meals in
            let filteredMeals = meals.filter{
                //remove any empty names
                !$0.name.isEmpty
            }
            .sorted {
                //sort alphabetically
                $0.name.lowercased() < $1.name.lowercased()
            }
            completion(filteredMeals)
        }
    }
    
    func getMealDetail(for id: Int, completion: @escaping ((MealDetail) -> Void)) {
        mealsStorage.getMealDetails(for: id) { mealDetails in
            let filteredIngridients = mealDetails.ingredients.filter {
                //remove any empty ingredients entries
                !$0.name.isEmpty && !$0.quantity.isEmpty
            }
            let filteredMealDetails = MealDetail(
                name: mealDetails.name,
                instructions: mealDetails.instructions,
                ingredients: filteredIngridients)
            
           completion(filteredMealDetails)
        }
    }
}
