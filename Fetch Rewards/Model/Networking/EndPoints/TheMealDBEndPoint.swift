//
//  TheMealDBEndPoint.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/14/22.
//

import Foundation

enum TheMealDBEndPoint: EndPoint {
    case getDessertMeals

    var scheme: String {
        return ""
    }
    
    var host: String {
        return ""
    }
    
    var path: String {
        ""
    }
    
    var queryItems: [String : String] {
        return [:]
    }
    
    #warning("instead of passing in the hard coded string, construct using URLComponents")
    var urlRequest: URLRequest {
        return URLRequest(url: URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
    }
}
