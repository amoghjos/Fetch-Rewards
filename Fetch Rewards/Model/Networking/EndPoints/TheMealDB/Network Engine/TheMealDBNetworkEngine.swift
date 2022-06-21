//
//  TheMealDBNetworkEngine.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/20/22.
//

import Foundation

//TheMealDBNetworkEngine is responsible for putting everything together. It uses the end point to construct URL and makes network requests using NetworkModel using NetworkResponse. It also happens to confirm to MealsStorage protocol and hence, currently, provides storage for Model Controllers
struct TheMealDBNetworkEngine: MealsStorage {
    
    private let networkModel: NetworkModel
    
    init(networkModel: NetworkModel = NetworkModel()){
        self.networkModel = networkModel
    }
    
    func getMeals(for category: MealCategory) -> [Meal] {
        return []
    }
}
