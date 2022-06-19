//
//  TheMealDBEndPoint.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/14/22.
//

import Foundation

enum TheMealDBEndPoint: EndPoint {
    
    case getMeals(category: MealsCategory)

    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "www.themealdb.com"
    }
    
    var path: String {
        "/api/json/v1/1/filter.php"
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getMeals(let category):
            return [URLQueryItem(name: "c", value: category.rawValue)]
        }
    }
}
