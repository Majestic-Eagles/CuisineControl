//
//  Food.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/24/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation

class Food {
    
    var name: String?
    var servingSize: String?
    var calories: Int?
    var protein: Int?
    var carbohydrates: Int?
    var fat: Int?
    var isPresent: Bool?
    var expirationDate: String?
    
    init(dictionary: [String: Any]) {
        
        let nutritionInfoDictionary = dictionary["nutrients"] as! [String: Any]
        name = dictionary["label"] as? String
        calories = nutritionInfoDictionary["ENERC_KCAL"] as? Int
        carbohydrates = nutritionInfoDictionary["CHOCDF"] as? Int
        protein = nutritionInfoDictionary["PROCNT"] as? Int
        fat = nutritionInfoDictionary["FAT"] as? Int
        
        
        
    }
    
}
