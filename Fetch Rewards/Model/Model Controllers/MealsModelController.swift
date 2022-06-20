//
//  MealsModelController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/20/22.
//

import Foundation

//Inspiration: https://www.swiftbysundell.com/articles/model-controllers-in-swift/
struct MealsModelController {
    
    let networkModel: NetworkModel
    
    init(networkModel: NetworkModel){
        self.networkModel = networkModel
    }
    
    func getMeals(for category: MealCategory) -> [Meal] {
//        let dessertEndPoint = EndPoints.TheMealDB.getMeals(category: .dessert)
//        let url = networkModel.getURL(for: dessertEndPoint)!
//        typealias TheMealDBResponse = TheMealDBNetworkResponse<[MealNetworkResponse]>?
//        networkModel.makeRequest(at: url) { (response: TheMealDBResponse, error) in
//            print(response?.meals)
//        }
        return []
    }
}
