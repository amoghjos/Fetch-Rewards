//
//  Fetch_RewardsTests.swift
//  Fetch RewardsTests
//
//  Created by Amogh Joshi on 6/14/22.
//

import XCTest
@testable import Fetch_Rewards

//Inspiration: https://www.swiftbysundell.com/articles/testing-networking-logic-in-swift/

class NetworkModelTests: XCTestCase {

    var sut: NetworkModel!
    
    override func setUpWithError() throws {
        sut = NetworkModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getURL_for_TheMealDBEndPoint_getMeals_for_category_dessert() throws {
        let expectedURL = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        let actualURL = try XCTUnwrap(sut.getURL(for: EndPoints.TheMealDB.getMeals(category: .dessert)))
        XCTAssertEqual(expectedURL, actualURL)
    }
}
