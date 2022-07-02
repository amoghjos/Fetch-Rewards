//
//  TheMealDBNetworkEngine.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/20/22.
//

import Foundation
import UIKit

//TheMealDBNetworkEngine is responsible for putting everything together. It uses the end point to construct URL and makes network requests using NetworkModel using NetworkResponse. It also happens to confirm to MealsStorage protocol and hence, currently, provides storage for Model Controllers
struct TheMealDBNetworkEngine: MealsStorage {
    
    private let networkModel: NetworkModel
    private let imageCache = NSCache<NSString, UIImage>()
    
    init(networkModel: NetworkModel = NetworkModel()){
        self.networkModel = networkModel
    }
    
    private func loadImage(from urlString: String, completion: @escaping ((UIImage) -> Void)){
        
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
    
    func getMeals(for category: MealCategory, completion: @escaping (([Meal]) -> Void)) {
        var meals = [Meal]()
        
        switch category {
            
        case .dessert:
            let endPoint = EndPoints.TheMealDB.getMeals(category: .dessert)
            let url = networkModel.getURL(for: endPoint)!
            
            typealias TheMealDBResponse = TheMealDBNetworkResponse<[MealNetworkResponse]>?
            
            networkModel.makeRequest(at: url) { (response:TheMealDBResponse, error) in
                //TODO: Instead of force unwrapping response, consider modifying the function so that it throws an error when response is invalid
                let dispatchGroup = DispatchGroup()
                for responseMeal in response!.meals {
                    dispatchGroup.enter()
                    loadImage(from: responseMeal.imageURL) { image in
                        let meal = Meal(name: responseMeal.name, image: image, id: Int(responseMeal.id)!)
                        meals.append(meal)
                        dispatchGroup.leave()
                    }
                }
                dispatchGroup.notify(queue: DispatchQueue.global()){
                    completion(meals)
                }
            }
        }
    }
    
    func getMealDetails(for id: Int, completion: @escaping ((MealDetails) -> Void)) {
        let endPoint = EndPoints.TheMealDB.getMealDetails(id: id)
        let url = networkModel.getURL(for: endPoint)!
        typealias TheMealDBResponse = TheMealDBNetworkResponse<[MealDetailsNetworkResponse]>?
        
        networkModel.makeRequest(at: url) { (response:TheMealDBResponse, error) in
            let responseDetails = response!.meals[0]
            
            let ingridients = [
                Ingredient(name: responseDetails.ingredient1, quantity: responseDetails.measurement1),
                Ingredient(name: responseDetails.ingredient2, quantity: responseDetails.measurement2),
                Ingredient(name: responseDetails.ingredient3, quantity: responseDetails.measurement3),
                Ingredient(name: responseDetails.ingredient4, quantity: responseDetails.measurement4),
                Ingredient(name: responseDetails.ingredient5, quantity: responseDetails.measurement5),
                Ingredient(name: responseDetails.ingredient6, quantity: responseDetails.measurement6),
                Ingredient(name: responseDetails.ingredient7, quantity: responseDetails.measurement7),
                Ingredient(name: responseDetails.ingredient8, quantity: responseDetails.measurement8),
                Ingredient(name: responseDetails.ingredient9, quantity: responseDetails.measurement9),
                Ingredient(name: responseDetails.ingredient10, quantity: responseDetails.measurement10),
                Ingredient(name: responseDetails.ingredient11, quantity: responseDetails.measurement11),
                Ingredient(name: responseDetails.ingredient12, quantity: responseDetails.measurement12),
                Ingredient(name: responseDetails.ingredient13, quantity: responseDetails.measurement13),
                Ingredient(name: responseDetails.ingredient14, quantity: responseDetails.measurement14),
                Ingredient(name: responseDetails.ingredient15, quantity: responseDetails.measurement15),
                Ingredient(name: responseDetails.ingredient16 ?? "", quantity: responseDetails.measurement16 ?? ""),
                Ingredient(name: responseDetails.ingredient17 ?? "", quantity: responseDetails.measurement17 ?? ""),
                Ingredient(name: responseDetails.ingredient18 ?? "", quantity: responseDetails.measurement18 ?? ""),
                Ingredient(name: responseDetails.ingredient19 ?? "", quantity: responseDetails.measurement19 ?? ""),
                Ingredient(name: responseDetails.ingredient20 ?? "", quantity: responseDetails.measurement20 ?? ""),
            ]
            
            let mealDetails = MealDetails(name: responseDetails.name,
                                          instructions: responseDetails.instructions,
                                          ingredients: ingridients)
            completion(mealDetails)
        }
    }
}
