//
//  EndPoint.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/14/22.
//

import Foundation

//EndPoint defines rules for any existing or new API we want to use
//Inspiration: https://www.swiftbysundell.com/articles/constructing-urls-in-swift/

protocol EndPoint {
    //e.g. http or https
    var scheme: String              { get }
    
    //e.g. api.github.com
    var host:   String              { get }
    
    // e.g. /search/repositories
    var path:   String              { get }
    
    //e.g. q="ios_projects"
    var queryItems: [URLQueryItem]  { get }
}
