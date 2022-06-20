//
//  Meal.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/19/22.
//

import Foundation

struct MealNetworkResponse: Codable {
    let name: String
    let id: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case id = "idMeal"
        case imageURL = "strMealThumb"
    }
}
