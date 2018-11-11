//
//  Food.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/24/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation
import Parse

class Food{
    
    var name: String? //Simple name given by the user, used for finding recipes
    var apiName: String? //Name under "label" section of the JSON data, sometimes not useful
    var servingSize: String? //Always equal to 100 grams with given API
    var calories: Int?
    var protein: Int?
    var carbohydrates: Int?
    var fat: Int?
    var isPresent: Bool?
    var expirationDate: String? //Entered by user when food is created
    
    init(dictionary: [String: Any], name: String, expirationDate: String, isIngredient: Int) {
        
        let nutritionInfoDictionary = dictionary["nutrients"] as! [String: Any]
        servingSize = "100 grams"
        apiName = dictionary["label"] as? String
        if let testCalories = nutritionInfoDictionary["ENERC_KCAL"] as? Int {
            calories = testCalories
        } else {
            calories = 0
        }
        print("Carbohydrates: ", nutritionInfoDictionary["CHOCDF"])
        if let testCarbohydrates = nutritionInfoDictionary["CHOCDF"] as? Int {
            print(carbohydrates)
            carbohydrates = testCarbohydrates
        } else {
            carbohydrates = 0
        }
        if let testProtein = nutritionInfoDictionary["PROCNT"] as? Int {
            protein = testProtein
        } else {
            protein = 0
        }
        if let testFat = nutritionInfoDictionary["FAT"] as? Int {
            fat = testFat
        } else {
            fat = 0
        }
        self.expirationDate = expirationDate
        self.name = name
        let newFoodObject = PFObject(className: "Foods")
        newFoodObject["servingSize"] = self.servingSize
        newFoodObject["apiName"] = self.apiName
        newFoodObject["calories"] = self.calories
        newFoodObject["carbohydrates"] = self.carbohydrates
        newFoodObject["protein"] = self.protein
        newFoodObject["fat"] = self.fat
        newFoodObject["expirationDate"] = self.expirationDate
        newFoodObject["name"] = self.name
        if isIngredient == 0 {
            newFoodObject["isIngredient"] = true
        } else {
            newFoodObject["isIngredient"] = false
        }
        newFoodObject["user"] = PFUser.current()
        newFoodObject.saveInBackground { (succes: Bool, error: Error?) in
            if succes {
                print("The food was saved")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        print(servingSize)
        print(apiName)
        print(calories)
        print(carbohydrates)
        print(protein)
        print(fat)
        print(self.expirationDate)
        print(self.name)
        
    }
    
}
