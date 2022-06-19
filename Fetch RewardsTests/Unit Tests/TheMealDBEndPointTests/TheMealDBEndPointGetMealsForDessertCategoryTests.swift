//
//  TheMealDBEndpointTests.swift
//  Fetch RewardsTests
//
//  Created by Amogh Joshi on 6/14/22.
//

import XCTest
@testable import Fetch_Rewards

class TheMealDBEndPointGetMealsForDessertCategoryTests: XCTestCase {
    
    var sut: EndPoint!
    
    override func setUpWithError() throws {
        sut = EndPoints.TheMealDB.getMeals(category: .dessert)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_get_meals_scheme() {
        XCTAssertEqual(sut.scheme,"https")
    }
    
    func test_get_meals_path() {
        XCTAssertEqual(sut.path, "/api/json/v1/1/filter.php")
    }
    
    func test_get_meals_host() {
        XCTAssertEqual(sut.host, "www.themealdb.com")
    }
    
    func test_get_meals_queryItems() {
        let expectedURLQueryItems = [URLQueryItem(name: "c", value: "Dessert")]
        let actualURLQueryItems = sut.queryItems
        XCTAssertEqual(expectedURLQueryItems, actualURLQueryItems)
    }
}
