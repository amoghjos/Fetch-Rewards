//
//  File.swift
//  Fetch RewardsTests
//
//  Created by Amogh Joshi on 6/19/22.
//

import Foundation
@testable import Fetch_Rewards

//Although the stub end point looks same as EndPoints.TheMealDB.getMeals(category: .dessert), I created a stub to isolate network model tests from TheMealDB. If I make changes to EndPoints, I don't want NetworkModelTests to start failing. Hence, a stub :)
struct StubEndPoint: EndPoint {
    var scheme = "https"
    
    var host = "www.themealdb.com"
    
    var path = "/api/json/v1/1/filter.php"
    
    var queryItems = [URLQueryItem(name: "c", value: "Dessert")]
}
