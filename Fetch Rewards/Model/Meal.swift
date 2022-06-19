//
//  Meal.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/19/22.
//

import Foundation

struct Meal: Decodable {
    let name: String
    let id: Int
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case id = "idMeal"
        case imageURL = "strMealThumb"
    }
}
