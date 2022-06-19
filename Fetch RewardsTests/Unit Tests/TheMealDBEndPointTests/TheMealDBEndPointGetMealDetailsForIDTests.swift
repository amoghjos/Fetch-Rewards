//
//  TheMealDBEndPointGetMealDetailsForIDTests.swift
//  Fetch RewardsTests
//
//  Created by Amogh Joshi on 6/19/22.
//

import XCTest
@testable import Fetch_Rewards

class TheMealDBEndPointGetMealDetailsForIDTests: XCTestCase {
    
    var sut: EndPoint!
    let randomMealID = 777
    
    override func setUpWithError() throws {
        sut = TheMealDBEndPoint.getMealDetails(id: randomMealID)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_getMealDetails_host() {
        XCTAssertEqual(sut.host, "www.themealdb.com")
    }
    
    func test_getMealDetails_scheme() {
        XCTAssertEqual(sut.scheme, "https")
    }
    
    func test_getMealDetails_path() {
        XCTAssertEqual(sut.path, "/api/json/v1/1/lookup.php")
    }
    
    func test_getMealDetails_query() {
        let expectedURLQueryItems = [URLQueryItem(name: "i", value: String(randomMealID))]
        let actualURLQueryItems = sut.queryItems
        XCTAssertEqual(expectedURLQueryItems, actualURLQueryItems)
    }
}
