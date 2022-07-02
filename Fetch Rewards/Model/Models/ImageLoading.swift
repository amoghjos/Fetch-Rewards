//
//  ImageLoading.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 7/2/22.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

//Citation: https://www.youtube.com/c/AryamanSharda

extension UIImageView {
    /// Loads an image from a URL and saves it into an image cache, returns
    /// the image if already available in the cache.
    /// - Parameter urlString: String representation of the URL to load the
    /// image from
    /// - Parameter placeholder: An optional placeholder to show while the
    /// image is being fetched
    /// - Returns: A reference to the data task in order to pause, cancel,
    /// resume, etc.
    @discardableResult
    func loadImageFromURL(urlString: String,
                          placeholder: UIImage? = nil) ->
    URLSessionDataTask? {
        self.image = nil
        let key = NSString(string: urlString)
        if let cachedImage = imageCache.object(forKey: key) {
            self.image = cachedImage
            return nil
        }
        guard let url = URL(string: urlString) else {
            return nil
        }
        if let placeholder = placeholder {
            self.image = placeholder
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                if let data = data,
                   let downloadedImage = UIImage(data: data) {
                    imageCache.setObject(downloadedImage,
                                         forKey:
                                           NSString(string: urlString))
                    self.image = downloadedImage
                }
            }
        }
        task.resume()
        
        return task
    }
}
