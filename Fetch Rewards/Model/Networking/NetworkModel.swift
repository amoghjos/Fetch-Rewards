//
//  NetworkModel.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/14/22.
//

import Foundation

//Inspiration: https://www.swiftbysundell.com/articles/creating-generic-networking-apis-in-swift/
struct NetworkModel {
    
    init(with session: URLSession = URLSession.shared){
        
    }
    
    func makeURLRequest(at url: URL, completion: @escaping ((Data?, Error?) -> Void)){
        
    }
    
    func getURL(for endpoint: EndPoint) -> URL? {
        var urlComponent = URLComponents()
        urlComponent.host = endpoint.host
        urlComponent.scheme = endpoint.scheme
        urlComponent.path = endpoint.path
        urlComponent.queryItems = endpoint.queryItems
        return urlComponent.url
    }
}
