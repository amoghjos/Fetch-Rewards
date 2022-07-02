//
//  ImageLoading.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 7/2/22.
//

import UIKit

fileprivate let imageCache = NSCache<NSString, UIImage>()

struct ImageLoader {
 
    static func loadImage(from urlString: String, completion: @escaping ((UIImage) -> Void)){
        
        //check if the image already exsits in cache
        let key = NSString(string: urlString)
        if let cachedImage = imageCache.object(forKey: key) {
            completion(cachedImage)
            return
        }
        
        //if not, make a url request
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data,
               let downloadedImage = UIImage(data: data)  {
                imageCache.setObject(downloadedImage,
                                     forKey:
                                        NSString(string: urlString))
                completion(downloadedImage)
            }
        }.resume()
    }
}
