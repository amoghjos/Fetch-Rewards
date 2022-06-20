//
//  URLProtocolMock.swift
//  Fetch RewardsTests
//
//  Created by Amogh Joshi on 6/20/22.
//

import Foundation

//Citation: https://www.hackingwithswift.com/articles/153/how-to-test-ios-networking-code-the-easy-way
//Used for testing makeGETRequest

class URLProtocolMock: URLProtocol {
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
