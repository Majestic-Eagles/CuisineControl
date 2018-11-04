//
//  Food.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/24/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation

class Food {
    
    var name: String? //Simple name given by the user, used for finding recipes
    var apiName: String? //Name under "label" section of the JSON data, sometimes not useful
    var servingSize: String? //Always equal to 100 grams with given API
    var calories: Int?
    var protein: Int?
    var carbohydrates: Int?
    var fat: Int?
    var isPresent: Bool?
    var expirationDate: String? //Entered by user when food is created
    
    init(dictionary: [String: Any], name: String, expirationDate: String) {
        
        let nutritionInfoDictionary = dictionary["nutrients"] as! [String: Any]
        servingSize = "100 grams"
        apiName = dictionary["label"] as? String
        calories = nutritionInfoDictionary["ENERC_KCAL"] as? Int
        carbohydrates = nutritionInfoDictionary["CHOCDF"] as? Int
        protein = nutritionInfoDictionary["PROCNT"] as? Int
        fat = nutritionInfoDictionary["FAT"] as? Int
        self.expirationDate = expirationDate
        self.name = name
        
        print(servingSize)
        print(apiName)
        print(calories)
        print(carbohydrates)
        print(protein)
        print(self.expirationDate)
        print(self.name)
        
    }
    
}
