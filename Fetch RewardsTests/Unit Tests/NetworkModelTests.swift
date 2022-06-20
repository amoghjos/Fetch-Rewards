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
    
    //Citation: https://www.hackingwithswift.com/articles/153/how-to-test-ios-networking-code-the-easy-way
    func test_makeRequest() throws {
        //expected data
        let inputURL = try XCTUnwrap(URL(string: "https://www.apple.com"))
        let expectedData = try XCTUnwrap("Apple".data(using: .utf8))
        let input = [inputURL:expectedData]
        
        //setup mock
        URLProtocolMock.testURLs = input
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self] //I'm using testURLs as static b/c we do not create an instance of URLProtocolMock but we still need to edit testURLs for testing purpose
        let urlSession = URLSession(configuration: config)
        sut = NetworkModel(with: urlSession)
        
        //make request
        let networkResponseExpectation = XCTestExpectation(description: "Receieve data from makeURLRequest")
        sut.makeURLRequest(at: inputURL){ actualData, error in
            XCTAssertNil(error)
            XCTAssertEqual(actualData, expectedData)
            networkResponseExpectation.fulfill()
        }
        wait(for: [networkResponseExpectation], timeout: 2)
    }
}

fileprivate class URLProtocolMock: URLProtocol {
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
