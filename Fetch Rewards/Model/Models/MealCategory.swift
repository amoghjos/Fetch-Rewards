//
//  MealCategory.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/20/22.
//

import Foundation

//Although MealCategory is same as TheMealDBCategory, we can't assume that all the meals will continue to come from TheMealDB API, what if we change API or add another API, so we need more permanent solution for the MealCategory and not expose TheMealDBCategory to the Controller side of the Application. We are essentially isolating Models from Networking
enum MealCategory {
    case dessert
}
