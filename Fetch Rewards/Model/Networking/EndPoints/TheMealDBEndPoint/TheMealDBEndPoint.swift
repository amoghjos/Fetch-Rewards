//
//  TheMealDBEndPoint.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/14/22.
//

import Foundation

enum TheMealDBEndPoint: EndPoint {
    
    case getMeals(category: MealsCategory)
    case getMealDetails(id: Int)

    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "www.themealdb.com"
    }
    
    var path: String {
        switch self {
        case .getMeals:
            return "/api/json/v1/1/filter.php"
        case .getMealDetails:
            return "/api/json/v1/1/lookup.php"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getMeals(let category):
            return [URLQueryItem(name: "c", value: category.rawValue)]
        case .getMealDetails(id: let id):
            return [URLQueryItem(name: "i", value: String(id))]
        }
    }
}
