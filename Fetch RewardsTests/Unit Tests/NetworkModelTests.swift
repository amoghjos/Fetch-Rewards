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

    func testExample() throws {
        
    }
}
