//
//  EndPoint.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/14/22.
//

import Foundation

//EndPoint defines rules for any existing or new API we want access through NetworkModel
//Inspiration: https://www.swiftbysundell.com/articles/constructing-urls-in-swift/

protocol EndPoint {
    var scheme: String              { get }            //e.g. http or https
    var host:   String              { get }            //e.g. api.github.com
    var path:   String              { get }            // e.g. /search/repositories
    var queryItems: [String:String] { get }            //e.g. q="ios projects"
}
