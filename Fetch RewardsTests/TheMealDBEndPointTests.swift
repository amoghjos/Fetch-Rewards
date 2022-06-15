//
//  TheMealDBEndpointTests.swift
//  Fetch RewardsTests
//
//  Created by Amogh Joshi on 6/14/22.
//

import XCTest
@testable import Fetch_Rewards

class TheMealDBEndPointTests: XCTestCase {
    
    var sut: EndPoint!
    
    func test_get_meals_in_the_dessert_category() throws {
        #warning("instead of using a stored property use a function as when we need to pass in a parameter, what would we do?")
        sut = TheMealDBEndPoint.getDessertMeals
        
        let expectedURL = try XCTUnwrap(URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"))
        let expectedURLRequest = URLRequest(url: expectedURL)
        let actualURLRequest = TheMealDBEndPoint.getDessertMeals.urlRequest
        XCTAssertEqual(expectedURLRequest, actualURLRequest)
    }
}
