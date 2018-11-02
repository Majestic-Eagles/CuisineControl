//
//  SpoonacularAPIManager.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 11/1/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation

class SpoonacularAPIManager {
    
    let mashapeKey = "rK5nKVV2OEmshp0oFPrLXjg6Bfhqp1TnN20jsn6DkUAOFLO25V"
    let testURL = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/food/products/upc/"
    let hostThing = "spoonacular-recipe-food-nutrition-v1.p.mashape.com"
    let session: URLSession
    static var shared: SpoonacularAPIManager = SpoonacularAPIManager()
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getFoodDataWithUPC(upc: String) {
        if let url = URL(string: testURL + upc) {
            var request = URLRequest(url: url)
            request.setValue(mashapeKey, forHTTPHeaderField: "X-Mashape-Key")
            request.setValue(hostThing, forHTTPHeaderField: "X-Mashape-Host")
            let task = session.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    let dictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    print(dictionary)
                } else {
                    print(error?.localizedDescription)
                }
            }
            task.resume()
        }
    }
    
}
