//
//  MealsStorage.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/20/22.
//

import Foundation

//MealsStorage defines rules for any entity who wants to create MealsModelController for how they can provide storage. It allows for loosely coupled architecture. For example, currently we are using networking to get Meals but what if we use CoreData or Firebase to get list of meals? 
protocol MealsStorage {
    func getMeals(for category: MealCategory, completion: @escaping (([Meal]) -> Void))
    #warning("add another function for getMealDetails(for id: Int) -> MealDetail")
    func getMealDetails(for id: Int, completion: @escaping (() -> Void))
}
