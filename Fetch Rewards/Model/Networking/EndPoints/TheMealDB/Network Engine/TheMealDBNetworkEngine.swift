//
//  TheMealDBNetworkEngine.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/20/22.
//

import Foundation
import UIKit

//TheMealDBNetworkEngine is responsible for putting everything together. It uses the end point to construct URL and makes network requests using NetworkModel using NetworkResponse. It also happens to confirm to MealsStorage protocol and hence, currently, provides storage for Model Controllers
struct TheMealDBNetworkEngine: MealsStorage {
    
    private let networkModel: NetworkModel
    
    init(networkModel: NetworkModel = NetworkModel()){
        self.networkModel = networkModel
    }
    
    func getMeals(for category: MealCategory) -> [Meal] {
        var meals = [Meal]()
        switch category {
        case .dessert:
            let endPoint = EndPoints.TheMealDB.getMeals(category: .dessert)
            let url = networkModel.getURL(for: endPoint)!
            
            typealias TheMealDBResponse = TheMealDBNetworkResponse<[MealNetworkResponse]>?
            
            networkModel.makeRequest(at: url) { (response:TheMealDBResponse, error) in
                for responseMeal in response!.meals {
                    #warning("get image from the url")
                    let image = UIImage(systemName: "tornado")!
                    
                    let meal = Meal(name: responseMeal.name, image: image, id: Int(responseMeal.id)!)
                    meals.append(meal)
                }
            }
        }
        
        return meals
    }
}
