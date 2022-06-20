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
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_getURL() throws {
        sut = NetworkModel()
        let expectedURL = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        let actualURL = try XCTUnwrap(sut.getURL(for: StubEndPoint()))
        XCTAssertEqual(expectedURL, actualURL)
    }
    
    func test_makeGETRequest_for_meal_model() throws {
        
        //expected result
        let expectedMeal = Meal(name: "Apam balik",
                                id: "53049",
                                imageURL: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        
        //arrange input
        let inputMealJSONData = """
        {
        "strMeal": "Apam balik",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
        "idMeal": "53049"
        }
        """.data(using: .utf8)!
        let inputURL = try XCTUnwrap(URL(string: "https://www.apple.com")) //It can be any URL
        let input = [inputURL:inputMealJSONData]
        
        //arrange mock
        URLProtocolMock.testURLs = input
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let urlSession = URLSession(configuration: config)
        sut = NetworkModel(with: urlSession)
        
        //act: make request
        let networkResponseExpectation = XCTestExpectation(description: "Receieve data from makeURLRequest")
        sut.makeGETRequest(at: inputURL) { (res: Result<Meal, Error> ) in
            
        }
//        sut.makeGETRequest(at: inputURL){ actualData: Meal, error in
//            //assert
//            XCTAssertNil(error)
//            XCTAssertEqual(actualData?.name, expectedMeal.name)
//            XCTAssertEqual(actualData?.id, expectedMeal.id)
//            XCTAssertEqual(actualData?.imageURL, expectedMeal.imageURL)
//            networkResponseExpectation.fulfill()
//        }
        wait(for: [networkResponseExpectation], timeout: 2)
    }
}

//Citation: https://www.hackingwithswift.com/articles/153/how-to-test-ios-networking-code-the-easy-way
fileprivate class URLProtocolMock: URLProtocol {
    //I'm using testURLs as static b/c we do not create an instance of URLProtocolMock but we still need to edit testURLs for testing purpose
    static var testURLs = [URL?: Data]()
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        if let url = request.url {
            
            if let data = URLProtocolMock.testURLs[url] {
                
                self.client?.urlProtocol(self, didLoad: data)
            }
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }
}
