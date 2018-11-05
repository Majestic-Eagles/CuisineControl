//
//  EdamamAPIManager.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/24/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation
import Parse

class EdamamAPIManager {
    
    let foodDatabaseApplicationID = "700a667e"
    let foodDatabaseApplicationKey = "12c0086d319c5d974cfc2a3182e14058"
    let searchApplicationID = "832f958b"
    let searchApplicationKey = "e8cf23abb1138f67a8fcee3299fb2f56"
    let appID = "&app_id="
    let appKey = "&app_key="
    let baseURLString = "https://api.edamam.com/"
    let searchString = "search?"
    let nameFoodDatabaseStringBase = "api/food-database/parser?ingr="
    let upcFoodDatabaseStringBase = "api/food-database/parser?upc="
    var returnedFoods: [PFObject]?
    var session: URLSession
    static var shared: EdamamAPIManager = EdamamAPIManager()
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getFoodDataWithUPC(upc: String, name: String, expirationDate: String, isIngredient: Int) {
        if let url = URL(string: baseURLString + upcFoodDatabaseStringBase + upc + appID + foodDatabaseApplicationID + appKey + foodDatabaseApplicationKey) {
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    let dictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    if let error = dictionary["error"] {
                        print(error)
                        print("Food upc not in database")
                        return
                    }
                    let hintsArray = dictionary["hints"] as! NSArray
                    let foodLabelDictionary = hintsArray[0] as! [String: Any]
                    let foodDataDictionary = foodLabelDictionary["food"] as! [String: Any]
                    print(foodDataDictionary)
                    let newFood = Food(dictionary: foodDataDictionary, name: name, expirationDate: expirationDate, isIngredient: isIngredient)
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
    
    func getRandomRecipe(user: PFUser) {
        
        let query = PFQuery(className: "Foods")
        query.whereKey("isIngredient", equalTo: true)
        query.whereKey("user", equalTo: user)
        print("Query started")
        
        query.findObjectsInBackground { (foods, error) in
            if let foods = foods {
                print("Query success")
                self.returnedFoods = foods
                let randomIngredientIndex = Int(arc4random_uniform(UInt32(self.returnedFoods!.count)))
                let randomIngredient = self.returnedFoods![randomIngredientIndex]["name"]
                let q = "q=\(randomIngredient)"
                
                let url = URL(string: self.baseURLString + self.searchString + q + self.appID + self.searchApplicationID + self.appKey + self.searchApplicationKey)
                let request = URLRequest(url: url!)
                let task = self.session.dataTask(with: request) { (data, response, error) in
                    if let data = data {
                        let dictionary = try! JSONSerialization.jsonObject(with: data, options: [])
                        print(dictionary)
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        
        
    }
    
    
}
