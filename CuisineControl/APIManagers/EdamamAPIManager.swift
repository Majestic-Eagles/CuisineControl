//
//  EdamamAPIManager.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/24/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation

class EdamamAPIManager {
    
    let foodDatabaseApplicationID = "700a667e"
    let foodDatabaseApplicationKey = "12c0086d319c5d974cfc2a3182e14058"
    let searchApplicationID = "832f958b"
    let searchApplicationKey = "e8cf23abb1138f67a8fcee3299fb2f56"
    let appID = "&app_id="
    let appKey = "&app_key="
    let baseURLString = "https://api.edamam.com/"
    let searchString = "search?q=chicken&app_id=832f958b&app_key=e8cf23abb1138f67a8fcee3299fb2f56"
    let nameFoodDatabaseStringBase = "api/food-database/parser?ingr="
    let upcFoodDatabaseStringBase = "api/food-database/parser?upc="
    var session: URLSession
    static var shared: EdamamAPIManager = EdamamAPIManager()
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getFoodDataWithUPC(upc: String, name: String, expirationDate: String) {
        if let url = URL(string: baseURLString + upcFoodDatabaseStringBase + upc + appID + foodDatabaseApplicationID + appKey + foodDatabaseApplicationKey) {
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    let dictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let hintsArray = dictionary["hints"] as! NSArray
                    let foodLabelDictionary = hintsArray[0] as! [String: Any]
                    let foodDataDictionary = foodLabelDictionary["food"] as! [String: Any]
                    let newFood = Food(dictionary: foodDataDictionary, name: name, expirationDate: expirationDate)
                    //print(foodDataDictionary)
                } else {
                    print(error?.localizedDescription)
                }
            }
            task.resume()
        }
    }
    
    func getFoodData(foodString: String) {
        
        var otherFoodString = foodString
        
        otherFoodString = foodString.replacingOccurrences(of: " ", with: "%20")
        
        if let url = URL(string: baseURLString + nameFoodDatabaseStringBase + otherFoodString + appID + foodDatabaseApplicationID + appKey + foodDatabaseApplicationKey) {
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    let dictionary = try! JSONSerialization.jsonObject(with: data, options: [])
                    print(dictionary)
                } else {
                    print(error?.localizedDescription)
                }
            }
            task.resume()
        }
        
        
    }
    
    
}
