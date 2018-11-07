//
//  Recipe.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/24/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation
import UIKit

class Recipe {
    
    var ingredients: [Food]?
    var name: String!
    var recipeImageURL: URL!
    var calories: Float!
    var protein: Float!
    var fat: Float!
    var carbohydrates: Float!
    var instructions: String!
    //var isAvailable: Bool!
    //var isMissing: [Food]?
    var cookTime: Float!
    
    init(dictionary: [String: Any]) {
        let recipeDictionary = dictionary["recipe"] as! [String: Any]
        let nutritionDictionary = recipeDictionary["totalNutrients"] as! [String: Any]
        print(recipeDictionary["calories"])
        print(recipeDictionary.keys)
        print(nutritionDictionary)
        name = recipeDictionary["label"] as! String
        recipeImageURL = URL(string: recipeDictionary["image"] as! String)
        calories = recipeDictionary["calories"] as! Float
        cookTime = recipeDictionary["totalTime"] as! Float
    }
    
    
}
