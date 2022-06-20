//
//  NetworkModel.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/14/22.
//

import Foundation

//Inspiration: https://www.swiftbysundell.com/articles/creating-generic-networking-apis-in-swift/
struct NetworkModel {
    
    var session: URLSession
    
    init(with session: URLSession = URLSession.shared){
        self.session = session
    }
    
    func makeGETRequest<T:Codable>(at url: URL, completion: @escaping (Result<T,Error>) -> Void){
        let task = session.dataTask(with: url) { data, response, error in
            let responseObject = try? JSONDecoder().decode(T.self, from: data!)
            completion(.success(responseObject!))
        }
        task.resume()
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
